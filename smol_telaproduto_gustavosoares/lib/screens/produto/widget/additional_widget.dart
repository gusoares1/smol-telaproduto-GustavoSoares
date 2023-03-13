import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smol_telaproduto_gustavosoares/screens/Produto/widget/iconButton_Widget.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_icon.dart';

class AdditionalWidget extends StatefulWidget {
  const AdditionalWidget({
    Key? key,
    required this.nomeAdicional,
    required this.valorAdicional,
    required this.onAdd,
    required this.onSubtrair,
    required this.quantidade,
    this.size = 39,
    this.sizeDbox = 105,
  }) : super(key: key);

  final String nomeAdicional;
  final double valorAdicional;
  final VoidCallback onAdd;
  final VoidCallback onSubtrair;
  final int quantidade;
  final double size;
  final double sizeDbox;

  @override
  State<AdditionalWidget> createState() => _AdditionalWidgetState();
}

class _AdditionalWidgetState extends State<AdditionalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, left: 1, right: 1),
      width: 358,
      height: widget.size,
      decoration: const BoxDecoration(
        color: AppColors.verde,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 0, left: 1),
        decoration: const BoxDecoration(
          color: AppColors.branco,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 0),
              child: Text(widget.nomeAdicional,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.cinzaEscuroFont)),
            ),
            SizedBox(
              width: widget.sizeDbox,
            ),
            Text(
                "+ R\$ ${widget.quantidade <= 0 ? widget.valorAdicional : widget.valorAdicional * widget.quantidade}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cinzaEscuroFont)),
            SizedBox(
              width: 10,
            ),
            widget.quantidade <= 0
                ? IconButtonWidget(
                    icon: AppIcon.PlusCircle,
                    onTap: widget.onAdd,
                    size: 14,
                  )
                : Container(
                    height: 21,
                    width: 69,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.6),
                        ),
                        border: Border.fromBorderSide(
                            BorderSide(color: AppColors.verde, width: 0.5))),
                    child: Row(
                      children: [
                        IconButtonWidget(
                          icon: AppIcon.PlusCircle,
                          onTap: widget.onAdd,
                          size: 14,
                        ),
                        SizedBox(
                          width: 36,
                          child: Center(
                            child: Text('${widget.quantidade}'),
                          ),
                        ),
                        IconButtonWidget(
                          icon: AppIcon.MinusCircle,
                          onTap: widget.onSubtrair,
                          size: 14,
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
