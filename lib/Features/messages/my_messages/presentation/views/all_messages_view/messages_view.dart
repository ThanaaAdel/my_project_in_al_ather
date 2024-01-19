import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/locale/app_localizations.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../sent_messages_view/sent_messages_view.dart';
import '../widgets/custom_toggle_app_bar.dart';
import '../widgets/messages_view_body.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    Size screenSize = MediaQuery.of(context).size;

    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      duration: const Duration(milliseconds: 300),
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 500),
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: screenSize * .12,
              child: CustomToggleAppBar(
                  appBarTitle: locale.translate('messages')!)),
          backgroundColor: Colors.white,
          floatingActionButton: ElevatedButton(
            onPressed: () {
              BlocProvider.of<BottomNavCubit>(context).navigationQueue.addLast(
                  BlocProvider.of<BottomNavCubit>(context).bottomNavIndex);
              BlocProvider.of<BottomNavCubit>(context)
                  .updateBottomNavIndex(kNewMessageView);
            },
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              elevation: const MaterialStatePropertyAll(4),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 7, horizontal: 10)),
              backgroundColor: const MaterialStatePropertyAll(
                kPrimaryColor,
              ),
            ),
            child: Text(locale.translate('new_message')!),
          ),
          body: SizedBox(
            child: TabBarView(
              children: <Widget>[
                MessagesViewBody(),
                const SentMessagesViewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
