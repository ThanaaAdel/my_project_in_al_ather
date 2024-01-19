import '../../../../../core/utils/gaps.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_orders_raw_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_request_text_field.dart';

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({super.key});

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

String checkOption = "قبول";

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.vGap16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "الاجراءات",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.cancel)),
              ],
            ),
            Column(
              children: [
                RadioListTile(
                  activeColor: kPrimaryColor,
                  title: const Text("قبول"),
                  value: "قبول",
                  groupValue: checkOption,
                  onChanged: (value) {
                    setState(() {
                      checkOption = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: kPrimaryColor,
                  title: const Text("رفض"),
                  value: "رفض",
                  groupValue: checkOption,
                  onChanged: (value) {
                    setState(() {
                      checkOption = value.toString();
                    });
                  },
                ),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const CustomOrdersRawIcon(
              rawText: "ملاحظات",
              iconImagePath: "assets/icons/notes_icon.png",
            ),
            Gaps.vGap5,
            CustomRequestsTextField(
              containerHeight: MediaQuery.of(context).size.height * .08,
              hintTextField: "",
            ),

            // CustomLoginTextField(
            //   width: double.infinity,
            //   stringInTextField: "ملاحظات",
            //   textInputType: TextInputType.text,
            //   obscureText: false,
            //   height: MediaQuery.of(context).size.height * 0.15,
            // ),
            Gaps.vGap10,
            CustomButton(
                screenWidth: double.infinity,
                buttonTapHandler: () {},
                buttonText: "حفظ")
          ],
        ),
      ),
    );
  }
}
