import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_icon.dart';
import 'iconButton_Widget.dart';

class nameProductDescriptionWidget extends StatelessWidget {
  const nameProductDescriptionWidget(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.color = AppColors.vermelho,
      this.size = 23,
      required this.nameProduct,
      required this.DescriptionProduct,
      required this.price})
      : super(key: key);

  final Color color;
  final String icon;
  final VoidCallback onTap;
  final double size;

  final String nameProduct;
  final String DescriptionProduct;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
      decoration: const BoxDecoration(
        color: AppColors.branco,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      nameProduct,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.cinzaEscuroFont),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "R\$ $price",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verdeEscuroFont),
                    ),
                  ],
                ),
                Text(
                  DescriptionProduct,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.cinzaEscuroFont),
                ),
              ],
            ),
          ),
          SizedBox(width: 145),
          IconButtonWidget(
            icon: icon,
            onTap: onTap,
            size: size,
            color: color,
          )
        ],
      ),
    );
  }
}
