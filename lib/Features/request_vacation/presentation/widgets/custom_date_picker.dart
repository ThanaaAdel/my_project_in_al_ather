import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_elevated_container.dart';
import '../../../table/presentation/manager/cubit/pick_date_cubit.dart';

// ignore: must_be_immutable
class CustomDatePicker extends StatelessWidget {
  final double? containerWidth;
  final double? containerHeight;
  final Function? onTap;
  final String customDatePickerText;

  CustomDatePicker({
    super.key,
    required this.customDatePickerText,
    this.containerWidth,
    this.containerHeight,
    this.onTap,
  });

  // ignore: prefer_typing_uninitialized_variables
  var selectedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: CustomElevatedContainer(
        alignment: Alignment.center,
        // decoration: BoxDecoration(

        //   borderRadius: BorderRadius.circular(15)),
        containerWidth: containerWidth ?? MediaQuery.of(context).size.width,
        containerHeight:
            containerHeight ?? MediaQuery.of(context).size.height * .07,
        containerChild: Padding(
            padding: const EdgeInsets.all(12.0),
            child: BlocBuilder<PickDateCubit, RequestPickDateState>(
              builder: (context, state) {
                return Text(
                  customDatePickerText,
                  textAlign: TextAlign.start,
                  style: selectedDate == null
                      ? const TextStyle(
                          color: Color(0xffababac),
                          fontSize: 13,
                        )
                      : null,
                );
              },
            )
            // BlocBuilder<PickDateCubit, RequestPickDateState>(
            //   builder: (context, state) {
            //     if (state is PickDateSuccess) {
            //       return Text(
            //         state.date,
            //         style: selectedDate == null
            //             ? const TextStyle(
            //                 color: Color(0xffababac),
            //                 fontSize: 13,
            //               )
            //             : null,
            //       );
            //     } else {
            //       return Text(
            //         widget.customDatePickerText,
            //         style: selectedDate == null
            //             ? const TextStyle(
            //                 color: Color(0xffababac),
            //                 fontSize: 13,
            //               )
            //             : null,
            //       );
            //     }
            //   },
            // ),
            ),
      ),
    );
  }
}
