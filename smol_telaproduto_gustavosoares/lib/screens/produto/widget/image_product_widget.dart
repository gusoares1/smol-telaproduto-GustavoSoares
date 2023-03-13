import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_images.dart';

class ImageProductWidget extends StatefulWidget {
  const ImageProductWidget({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  State<ImageProductWidget> createState() => _ImageProductWidgetState();
}

class _ImageProductWidgetState extends State<ImageProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          border: Border.fromBorderSide(
              BorderSide(color: AppColors.cinza, width: 0.5))),
      child: PositionedDirectional(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset(widget.image),
        ),
      ),
    );
  }
}
