import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/gaps.dart';
import '../../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../../core/widgets/custom_simple_app_bar.dart';
import '../../../../../auth/login/domain/entities/login_entity.dart';
import '../../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../manager/cubit/message_details_cubit.dart';

class MessageDetailsView extends StatelessWidget {
  final String? messageId;
  const MessageDetailsView({
    super.key,
    this.messageId,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MessageDetailsCubit>(context)
        .getMessageDetails(BlocProvider.of<BottomNavCubit>(context).messageId!);
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    var box = Hive.box<LoginEntity>(kEmployeeDataBox);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).size * .08,
        child: CustomSimpleAppBar(
          backgroundColor: const Color(0x299a80d9),
          appBarTitle: locale.translate("message_details")!,
        ),
      ),
      body: BlocBuilder<MessageDetailsCubit, MessageDetailsState>(
        builder: (context, state) {
          if (state is MessageDetailsSuccessful) {
            return SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: screenSize.height * .1,
                      alignment: Alignment.bottomCenter,
                      color: const Color(0x299a80d9),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            child: CustomCashedNetworkImage(
                                imageUrl: state.data![0].fromEmpImg!),
                          ),
                        ),
                        trailing: Text(
                          state.data![0].msgTime!,
                          overflow: TextOverflow.ellipsis,
                        ),
                        title: Text(
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                          "${state.data![0].fromEmployeeName}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          "${locale.translate("to")!} : ${box.get(kEmployeeDataBox)!.employeeName}",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Gaps.vGap10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.data![0].message!),
                          Gaps.vGap40,
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/pdf_icon.png",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 40,
                              ),
                              Gaps.hGap10,
                              const Text("No File"),
                            ],
                          ),
                          Gaps.vGap10,
                          const Divider(
                            color: Colors.black,
                            endIndent: 1,
                            indent: 2,
                          ),
                          Gaps.vGap10,
                          InkWell(
                            onTap: () {
                              BlocProvider.of<BottomNavCubit>(context)
                                  .updateBottomNavIndex(kNewMessageView);
                            },
                            child: Row(
                              children: [
                                Image.asset("assets/icons/replay_icon.png"),
                                Gaps.hGap10,
                                Text(locale.translate("replay")!),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            );
          } else if (state is MessageDetailsLoading) {
            return const CustomLoadingWidget();
          } else {
            return const CustomErrorWidget();
          }
        },
      ),
    );
  }
}
