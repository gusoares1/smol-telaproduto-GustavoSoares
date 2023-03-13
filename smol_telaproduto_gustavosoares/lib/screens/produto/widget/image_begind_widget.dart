import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../shared/themes/app_images.dart';

class imageBegindWidget extends StatelessWidget {
  const imageBegindWidget({Key? key, required this.size, required this.image})
      : super(key: key);

  final double size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, size, 0, 0),
      child: SizedBox(
          width: 375,
          height: 90,
          child: Image.asset(
            image,
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
