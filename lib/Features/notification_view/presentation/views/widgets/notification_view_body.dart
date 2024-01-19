import 'package:HrmsVersions/core/utils/gaps.dart';
import 'package:HrmsVersions/core/widgets/custom_simple_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../core/locale/app_localizations.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/media_query_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/widgets/error_text.dart';
import '../../../../auth/login/domain/entities/login_entity.dart';
import '../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../../messages/my_messages/data/models/my_messages_model/datum.dart';

import '../../../../messages/my_messages/presentation/manager/cubit/my_messages_cubit.dart';
import '../../../../messages/my_messages/presentation/manager/cubit/seen_message_cubit.dart';
import '../../../../messages/my_messages/presentation/views/widgets/all_messages_list_item.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    getNotSeenMessages(context);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    SizeConfig().init(context);
    var box = Hive.box<LoginEntity>(kEmployeeDataBox);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // CustomAppBar(
          //   icon: const Icon(Icons.arrow_forward),
          //   function: () {
          //     Navigator.pop(context);
          //   },
          // ),
          CustomSimpleAppBar(
            backHandler: () {
              BlocProvider.of<BottomNavCubit>(context).updateBottomNavIndex(4);
            },
            appBarTitle: locale.translate('notifications')!,
          ),
          BlocBuilder<MyMessagesCubit, MyMessagesState>(
            builder: (context, state) {
              if (state is FetchSuccessful) {
                AllMessagesList messagesList = state.data!;

                return Column(
                  children: [
                    Gaps.vGap30,
                    RefreshIndicator(
                      onRefresh: () async {
                        return getNotSeenMessages(context);
                      },
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .7,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                BlocProvider.of<BottomNavCubit>(context)
                                    .navigationQueue
                                    .addLast(
                                        BlocProvider.of<BottomNavCubit>(context)
                                            .bottomNavIndex);
                                BlocProvider.of<BottomNavCubit>(context)
                                  ..updateBottomNavIndex(
                                    kMessagesDetailsView,
                                  )
                                  ..getMessageId(state.data![index].msgId!);
                                BlocProvider.of<SeenMessageCubit>(context)
                                    .setAsSeen(state.data![index].msgId!,
                                        box.get(kEmployeeDataBox)!.userId);
                              },
                              child: AllMessagesListItem(
                                messagesList: messagesList,
                                itemIndex: index,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is FetchLoading) {
                return const CustomLoadingWidget(
                  loadingText: "جاري تحميل الرسائل",
                );
              } else if (state is FetchFailed) {
                return Center(child: Text(state.message));
              } else if (box.get(kEmployeeDataBox) == null) {
                return ErrorText(
                    image: "assets/images/should_login.png",
                    text: AppLocalizations.of(context)!
                        .translate('you_should_login_first')!);
              } else {
                return const ErrorText(text: "حدث خطأ ما");
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> getNotSeenMessages(context) async {
    var box = Hive.box<LoginEntity>(kEmployeeDataBox);

    if (box.get(kEmployeeDataBox) != null) {
      await BlocProvider.of<MyMessagesCubit>(context)
          .getAllMessages(box.get(kEmployeeDataBox)!.userId, "0");
    }
  }
}
