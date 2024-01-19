import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/setup_service_locator.dart';
import '../../../../core/widgets/error_text.dart';
import '../../../auth/login/domain/entities/login_entity.dart';
import '../../../auth/login/presentation/manger/login_cubit.dart';
import '../../../auth/login/presentation/views/login_view.dart';
import '../../../auth/register/presentation/manager/cubit/phone_auth_cubit.dart';
import '../../../bottom_nav/presentation/views/bottom_nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _connectionStatus = 'ConnectivityResult.wifi';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    bool status = _connectionStatus == (ConnectivityResult.mobile).toString() ||
        _connectionStatus == (ConnectivityResult.wifi).toString();

    var box = Hive.box<LoginEntity>(kEmployeeDataBox);

    return status
        ? box.get(kEmployeeDataBox) == null
            ? MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt<PhoneAuthCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => getIt<LoginCubit>(),
                  ),
                ],
                child: const LoginView(),
              )
            : const BottomNav()
        : Center(
            child: ErrorText(
              width: MediaQuery.of(context).size.width,
              text: 'No internet connection !',
              isNetwork: true,
              image: "assets/images/network_error.png",
            ),
          );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}
