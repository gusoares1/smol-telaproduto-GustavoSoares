import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smol_telaproduto_gustavosoares/shared/themes/app_colors.dart';

import '../../../shared/themes/app_icon.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.size = 24,
      this.color = AppColors.verde})
      : super(key: key);

  final Color color;
  final String icon;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          height: size,
          width: size,
          child: SvgPicture.asset(
            icon,
            color: color,
          ),
        ));
  }
}
