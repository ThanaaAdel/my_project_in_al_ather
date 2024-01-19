import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/constants.dart';
import '../utils/gaps.dart';

class ErrorText extends StatelessWidget {
  final String text;
  final bool isNetwork;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final String? image;

  const ErrorText(
      {Key? key,
      required this.text,
      this.isNetwork = false,
      this.width,
      this.margin,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? SafeArea(child: Scaffold(body: _buildContainer(context)))
        : _buildContainer(context);
  }

  _buildContainer(BuildContext context) {
    return ZoomIn(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // HiveHelper.getLogoUrl().isNotEmpty
            //     ? CustomImage(
            //         HiveHelper.getLogoUrl(),
            //         width: MediaQuery.of(context).size.width * .2,
            //         height: MediaQuery.of(context).size.width * .2,
            //         radius: 15,
            //         bgColor: Colors.grey,
            //         borderColor: Colors.grey,
            //         isContainer: false,
            //         fit: BoxFit.contain,
            //       )
            //     :

            Image.asset(
              // isNetwork! ? AppImages.userNetworkError : AppImages.userNoData,
              image ?? AssetsData.logo,
              fit: BoxFit.contain,
              height: 150, width: 150,
              //color: kPrimaryColor,
            ),
            Gaps.vGap15,
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: kPrimaryColor,
                    fontSize: MediaQuery.of(context).size.width * .04,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
