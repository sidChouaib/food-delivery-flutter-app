import 'package:cibweb/core/theme/app_decoration.dart';
import 'package:cibweb/core/theme/custom_text_style.dart';
import 'package:cibweb/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SizeItemFoodWidget extends StatelessWidget {
  final String? productSize;
  const SizeItemFoodWidget({super.key, required this.productSize});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      height: 48,
      width: 48,
      decoration: AppDecoration.fillblueGray.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder24,
      ),
      child: Center(
          child: Text(productSize ?? "N",
              style: CustomTextStyles.bodyLargeBluegray900)),
    );
  }
}
