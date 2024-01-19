import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'request_vacation_state.dart';

class RequestVacationCubit extends Cubit<RequestVacationState> {
  RequestVacationCubit() : super(RequestVacationInitial());
  File? selectedFile;
  String? fileName;
  File? fileSize;
  Future<void> pickFileFromDevice() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);
    if (result != null) {
      PlatformFile file = result.files.first;

      if (['jpg', 'jpeg', 'png', 'gif', 'jfif', 'pjpeg', 'pjp', 'svg']
          .any(file.extension!.toLowerCase().contains)) {
        selectedFile = File(result.files.single.path!);
        emit(PickImageState(selectedFile!));
      } else {
        selectedFile = File(result.files.single.path!);

        fileName = file.name;
        emit(PickFileState(fileName!, selectedFile!));
      }
    } else {}
  }
}
