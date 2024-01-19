import '../../../../core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_elevated_container.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key, required this.timePickerText});
  final String timePickerText;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  // ignore: prefer_typing_uninitialized_variables
  var pickedTime;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        showTimePicker(context: context, initialTime: TimeOfDay.now())
            .then((value) {
          setState(() {
            pickedTime = value!.format(context);
          });
        });
      },
      child: CustomElevatedContainer(
          alignment: Alignment.centerRight,
          containerWidth: screenSize.width * .4,
          containerHeight: screenSize.height * .045,
          containerChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              pickedTime == null
                  ? widget.timePickerText
                  : pickedTime.toString(),
              textAlign: TextAlign.left,
              style: const TextStyle(color: kTextColor),
            ),
          )),
    );
  }
}
