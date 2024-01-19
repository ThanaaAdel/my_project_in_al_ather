import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/constants.dart';
import '../utils/gaps.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.loadingText = "جاري التحميل"});
  final String loadingText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .15,
          ),
          Image.asset(
            AssetsData.logo,
            color: kPrimaryColor,
            width: MediaQuery.of(context).size.width * .3,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Gaps.vGap30,
          const CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          Gaps.vGap12,
          Text(loadingText),
        ],
      ),
    );
  }
}
