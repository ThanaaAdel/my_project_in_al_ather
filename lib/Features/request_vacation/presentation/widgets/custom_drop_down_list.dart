import 'package:flutter/material.dart';

import '../../../../core/locale/app_localizations.dart';

// ignore: must_be_immutable
class CustomDropDownList extends StatefulWidget {
  CustomDropDownList({super.key, required this.hintText, this.width});
  String hintText;
  double? width;
  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  List<String> items = ["1", "2"];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    late AppLocalizations locale;
    locale = AppLocalizations.of(context)!;
    return Container(
        // alignment: Alignment.center,
        width: widget.width,
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xfff9f9f9),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1c000000),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: DropdownMenu(
            width: MediaQuery.of(context).size.width * .9,
            label: Text(locale.translate('choose')!),
            onSelected: (value) {
              debugPrint(value.toString());
            },
            inputDecorationTheme: const InputDecorationTheme(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "1", label: "1"),
              DropdownMenuEntry(value: "2", label: "2"),
            ]));
  }
}
