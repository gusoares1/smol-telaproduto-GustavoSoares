import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smol_telaproduto_gustavosoares/screens/Produto/widget/iconButton_Widget.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/produto.dart';
import 'package:smol_telaproduto_gustavosoares/shared/themes/app_colors.dart';
import 'package:smol_telaproduto_gustavosoares/shared/themes/app_icon.dart';

class BorderTotal extends StatelessWidget {
  const BorderTotal(
      {Key? key,
      required this.color,
      required this.icon,
      this.size_width = 24,
      this.size_height = 24,
      required this.priceTotal,
      required this.onAdd,
      required this.onSubtrair,
      required this.quantidade,
      required this.quantidadeAdicional})
      : super(key: key);

  final Color color;
  final String icon;
  final VoidCallback onAdd;
  final VoidCallback onSubtrair;
  final double size_width;
  final double size_height;
  final double priceTotal;
  final int quantidade;
  final int quantidadeAdicional;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1, left: 1, right: 1),
      width: size_width,
      height: size_height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          IconButtonWidget(
            icon: AppIcon.PlusCircle,
            onTap: onAdd,
            size: 14,
            color: AppColors.verdeEscuro,
          ),
          SizedBox(
            width: 17,
            child: Center(
              child: Text('${quantidade}',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.branco)),
            ),
          ),
          IconButtonWidget(
            icon: AppIcon.MinusCircle,
            onTap: onSubtrair,
            size: 14,
            color: AppColors.verdeEscuro,
          ),
          SizedBox(
            width: 60,
          ),
          Center(
            child: SizedBox(
              width: 55,
              child: Center(
                child: Text('R\$ $priceTotal',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.branco)),
              ),
            ),
          ),
          SizedBox(
            width: 55,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
                  return AppColors.verdeEscuro;
                },
              )),
              onPressed: () {
                quantidadeAdicional >= 3
                    ? Scaffold.of(context).showBottomSheet(
                        backgroundColor: AppColors.amarelo,
                        (context) => SizedBox(
                          height: 251,
                          width: 375,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              border: Border.fromBorderSide(
                                  BorderSide(color: AppColors.cinza, width: 1)),
                            ),
                            child: Center(
                                child: Column(
                              children: [
                                Text('Produto Adicionado'),
                                ElevatedButton(
                                    style: ButtonStyle(backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color?>(
                                      (states) {
                                        return AppColors.verdeEscuro;
                                      },
                                    )),
                                    onPressed: () {
                                      RefreshIndicator(
                                          onRefresh: () async => Produto(),
                                          child: Text(''));
                                    },
                                    child: Text('OK'))
                              ],
                            )),
                          ),
                        ),
                      )
                    : Scaffold.of(context).showBottomSheet(
                        (context) => Stack(
                            alignment: AlignmentDirectional.topCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -15,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.verdeEscuro,
                                  ),
                                  width: 60,
                                  height: 7,
                                ),
                              ),
                              SizedBox(
                                height: 251,
                                width: 375,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    border: Border.fromBorderSide(BorderSide(
                                        color: AppColors.cinza, width: 1)),
                                  ),
                                  child: Center(
                                      child: Container(
                                    child: Text(
                                        'Obrigatorio escolher 3 Adicionais'),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.vermelhoAlerta,
                                      border: Border.fromBorderSide(BorderSide(
                                          color: AppColors.cinzaEscuroFont,
                                          width: 1)),
                                    ),
                                  )),
                                ),
                              ),
                            ]),
                      );
              },
              child: Text('Adicionar',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.branco,
                  )))
        ],
      ),
    );
  }
}
