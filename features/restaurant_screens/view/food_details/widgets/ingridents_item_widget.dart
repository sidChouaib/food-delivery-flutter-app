import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/utlis/image_constant.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:cibweb/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

import 'package:cibweb/core/theme/theme_helper.dart';

// ignore: must_be_immutable
class IngridentstextItemWidget extends StatelessWidget {
  const IngridentstextItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 48,
          width: 48,
          decoration: AppDecoration.fillblueGray.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder24,
          ),
          child: CustomImageView(
            margin: const EdgeInsets.all(10),
            imagePath: ImageConstant.imgThumbsUp,
            color: appTheme.lightBlue400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Salt",
          style: theme.textTheme.labelLarge,
        ),
      ],
    );
  }
}
