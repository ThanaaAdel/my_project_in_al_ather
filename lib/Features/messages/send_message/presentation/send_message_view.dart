import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../../core/locale/app_localizations.dart';

import '../../../../core/utils/commons.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/registration_alert.dart';
import '../../../../core/utils/functions/validation_mixin.dart';
import '../../../../core/utils/gaps.dart';
import '../../../../core/widgets/custom_elevated_container.dart';
import '../../../../core/widgets/custom_simple_app_bar.dart';

import 'package:dropdown_search/dropdown_search.dart';
import '../../../../core/widgets/custom_login_text_field.dart';
import 'package:flutter/material.dart';

import '../../../auth/login/domain/entities/login_entity.dart';
import '../../../bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import '../../../request_vacation/presentation/cubit/request_vacation_cubit.dart';
import '../../employees/data/models/employees/datum.dart';
import '../../employees/data/models/employees/employees.dart';
import '../../employees/presentation/manager/cubit/employees_cubit.dart';
import 'check.dart';
import 'manger/send_message_cubit.dart';

class SendMessageView extends StatefulWidget {
  const SendMessageView({super.key});

  @override
  State<SendMessageView> createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView>
    with ValidationMixin {
  File? selectedFile;
  List<int> selectedEmpId = [];
  final _multiKey = GlobalKey<DropdownSearchState<Datum>>();

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<LoginEntity>(kEmployeeDataBox);
    box.isNotEmpty
        ? BlocProvider.of<EmployeesCubit>(context).getMyMessages("5")
        : null;
    // final toEmpIdController = TextEditingController();
    final messageTitleController = TextEditingController();
    final messageBodyController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool? popupBuilderSelection = false;

    // void _handleCheckBoxState({bool updateState = true}) {
    //   var selectedItem = _multiKey.currentState?.popupGetSelectedItems ?? [];
    //   var isAllSelected =
    //       _multiKey.currentState?.popupIsAllItemSelected ?? false;
    //   _popupBuilderSelection =
    //       selectedItem.isEmpty ? false : (isAllSelected ? true : null);

    //   if (updateState) setState(() {});
    // }

    // _handleCheckBoxState(updateState: false);

    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return FadeInUp(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: MediaQuery.of(context).size * .1,
          child: CustomSimpleAppBar(
            appBarTitle: "رسالة جديدة",
            leadingWidget: Builder(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocConsumer<SendMessageCubit, SendMessageState>(
                    listener: (context, state) {
                      if (state is SendMessageSuccessful) {
                        Commons.showToast(context,
                            message: state.user.doneMessage);
                        BlocProvider.of<BottomNavCubit>(context)
                            .updateBottomNavIndex(kMessagesView);
                      } else if (state is SendMessageFailed) {
                        Commons.showToast(context, message: state.message);
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (box.get(kEmployeeDataBox) != null) {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SendMessageCubit>(context)
                                  .sendData(
                                box.get(kEmployeeDataBox)!.userId,
                                selectedEmpId,
                                messageTitleController.text,
                                messageBodyController.text,
                                selectedFile,
                              );
                            }
                          } else {
                            AlertDialog alert = alertRegistration(
                                context,
                                AppLocalizations.of(context)!
                                    .translate('you_should_login_first')!, () {
                              Navigator.pushReplacementNamed(
                                  context, kLoginScreenRoute);
                            }, "assets/images/should_login.png");

                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        },
                        child: state is SendMessageLoading
                            ? const CircularProgressIndicator()
                            : Image.asset("assets/icons/send_icon.png",
                                color: kPrimaryColor),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      await BlocProvider.of<RequestVacationCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: Image.asset(
                      "assets/icons/attachment_icon.png",
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   locale.translate('to')!,
                  // ),
                  // Gaps.vGap10,
                  // OutPutContainer(
                  //   containerIconPath: "assets/icons/calender_icon.png",
                  //   containerTitle: "",
                  //   containerWidth: double.infinity,
                  //   containerText: "alatheer123@gmail.com",
                  // ),
                  // Gaps.vGap10,
                  Text(
                    locale.translate('to')!,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<EmployeesCubit, EmployeesState>(
                          builder: (context, state) {
                            if (box.isEmpty) {
                              return Text(
                                locale.translate('you_should_login_first')!,
                              );
                            } else if (state is FetchLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is FetchSuccessful) {
                              EmployeesList employeesList = state.data!;
                              return SizedBox(
                                child: DropdownSearch<Datum>.multiSelection(
                                  dropdownBuilder: (context, selectedItems) {
                                    return ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      leading: Icon(
                                        selectedItems.isNotEmpty
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: kPrimaryColor,
                                      ),
                                      title: Text(
                                        selectedItems.isEmpty
                                            ? "Select employees to send message "
                                            : selectedItems.length ==
                                                    employeesList.length
                                                ? "All employees selected"
                                                : "selected ${selectedItems.length} employees",
                                        style: const TextStyle(
                                            fontSize: 12, color: kPrimaryColor),
                                      ),
                                    );
                                  },
                                  key: _multiKey,
                                  items: employeesList,
                                  itemAsString: (Datum? item) =>
                                      item!.employee!,
                                  //selectedItems: [],
                                  //enabled: false,
                                  clearButtonProps: const ClearButtonProps(
                                      isVisible: true,
                                      icon: Icon(
                                        Icons.close,
                                        size: 24,
                                        color: kPrimaryColor,
                                      )),
                                  popupProps: PopupPropsMultiSelection.menu(
                                      validationWidgetBuilder:
                                          (ctx, selectedItems) {
                                        return Container(
                                          color: kPrimaryColor,
                                          height: 56,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: MaterialButton(
                                              child: const Text(
                                                'Select',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                _multiKey.currentState
                                                    ?.popupOnValidate();

                                                // Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      containerBuilder: (ctx, popupWidget) {
                                        return CheckBoxWidget(
                                          isSelected: popupBuilderSelection,
                                          onChanged: (v) {
                                            if (v == true) {
                                              _multiKey.currentState!
                                                  .popupSelectAllItems();
                                            } else if (v == false) {
                                              _multiKey.currentState!
                                                  .popupDeselectAllItems();
                                            }
                                            // _handleCheckBoxState();
                                          },
                                          child: popupWidget,
                                        );
                                      },
                                      //  showSelectedItems: true,
                                      showSearchBox: true,
                                      selectionWidget:
                                          (context, item, isSelected) {
                                        return Icon(
                                          isSelected
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color: kPrimaryColor,
                                        );
                                      },
                                      textDirection: TextDirection.rtl,
                                      constraints: BoxConstraints.tight(
                                          const Size.fromHeight(400)),
                                      searchFieldProps: TextFieldProps(
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              // alignLabelWithHint: false,
                                              hintText:
                                                  locale.translate('search')!,
                                              suffixIcon: Container(
                                                decoration: const BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10))),
                                                child: const Icon(
                                                  Icons.search,
                                                  color: Colors.white,
                                                ),
                                              )))

                                      // disabledItemFn: (String s) => s.startsWith('I'),
                                      ),
                                  validator: (value) {
                                    selectedEmpId.clear();
                                    if (value == null || value.isEmpty) {
                                      return locale
                                          .translate('enter_valid_data')!;
                                    } else {
                                      for (var item in value) {
                                        //     if (selectedEmpId.contains(item)) {}
                                        selectedEmpId
                                            .add(int.parse(item.userId!));
                                      }

                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    if (value.length == employeesList.length) {
                                      popupBuilderSelection = true;
                                    } else {
                                      popupBuilderSelection = false;
                                    }
                                    // print(selectedEmpId);
                                  },
                                ),
                              );
                            } else if (state is FetchFailed) {
                              return Text(state.message);
                            }
                            return ErrorWidget("Error");
                          },
                        )
                        // CustomLoginTextField(
                        //   validator: validateInputText,
                        //   controller: toEmpIdController,
                        //   stringInTextField: "alatheer123@gmail.com",
                        //   obscureText: false,
                        //   textInputType: TextInputType.text,
                        //   width: double.infinity,
                        // ),
                        ,
                        Gaps.vGap10,
                        Text(
                          locale.translate('title_of_message')!,
                        ),
                        CustomLoginTextField(
                          validator: validateInputText,
                          controller: messageTitleController,
                          stringInTextField:
                              locale.translate('title_of_message')!,
                          obscureText: false,
                          textInputType: TextInputType.text,
                          width: double.infinity,
                        ),
                        Gaps.vGap10,
                        Text(
                          locale.translate('message_text')!,
                        ),
                        CustomLoginTextField(
                          validator: validateInputText,
                          controller: messageBodyController,
                          stringInTextField: locale.translate('message_text')!,
                          textInputType: TextInputType.text,
                          obscureText: false,
                          height: 50,
                          width: double.infinity,
                          multiLine: 10,
                        ),
                      ],
                    ),
                  ),
                  Gaps.vGap30,
                  Text(
                    locale.translate('attachments')!,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<RequestVacationCubit>(context)
                          .pickFileFromDevice();
                    },
                    child: CustomElevatedContainer(
                      containerHeight: MediaQuery.of(context).size.height * .12,
                      containerWidth: MediaQuery.of(context).size.width,
                      containerChild: BlocBuilder<RequestVacationCubit,
                          RequestVacationState>(
                        builder: (context, state) {
                          if (state is PickFileState) {
                            selectedFile = state.filePath;

                            return Center(
                              child: Text(state.fileName),
                            );
                          } else if (state is PickImageState) {
                            selectedFile = state.imagePath;
                            return Image.file(state.imagePath);
                          } else {
                            return Image.asset(
                              "assets/images/upload_cloud.png",
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              //  MediaQuery.of(context).size.width * 1
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Gaps.vGap30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
