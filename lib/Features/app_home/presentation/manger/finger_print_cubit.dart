// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../domain/entities/finger_print_entity.dart';
import '../../domain/use_cases/finger_print_use_case.dart';

part 'finger_print_state.dart';

class FingerPrintCubit extends Cubit<FingerPrintState> {
  final FingerPrintUseCase fingerPrint;
  bool isLoading = false;
  Position? _currentPosition;

  FingerPrintCubit(this.fingerPrint) : super(FingerPrintInitial());

  Future<void> getUserData(
      String empId, String branchId, String type, context) async {
    await _getCurrentPosition(context);
    if (_currentPosition != null) {
      String lat = _currentPosition!.latitude.toString();
      String long = _currentPosition!.longitude.toString();

      emit(const FingerPrintLoading());
      final result = await fingerPrint.call(empId, branchId, type, lat, long);

      emit(result.fold(FingerPrintFailed.new, FingerPrintSuccessful.new));
    } else {
      await _getCurrentPosition(context);
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      // setState(() {
      //   _currentAddress =
      //       '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      // });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentPosition(context) async {
    final hasPermission = await _handleLocationPermission(context);

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<bool> _handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));

      await Geolocator.openLocationSettings();

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }
}
