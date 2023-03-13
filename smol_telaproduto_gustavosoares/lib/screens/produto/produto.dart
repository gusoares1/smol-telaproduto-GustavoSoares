import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/widget/Image_begind_widget.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/widget/additional_widget.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/widget/border_total.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/widget/iconButton_widget.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/widget/image_product_widget.dart';
import 'package:smol_telaproduto_gustavosoares/screens/produto/widget/name_product_description_widget.dart';
import 'package:smol_telaproduto_gustavosoares/shared/themes/app_colors.dart';
import 'package:smol_telaproduto_gustavosoares/shared/themes/app_icon.dart';
import 'package:smol_telaproduto_gustavosoares/shared/themes/app_images.dart';

class Produto extends StatefulWidget {
  Produto({Key? key}) : super(key: key);

  @override
  State<Produto> createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  double valorTotal = 0;
  final double price = 4.5;
  final double valorAdicional1 = 1.25;
  final double valorAdicional2 = 1.25;
  final double valorAdicional3 = 1.25;
  int quantidade1 = 0;
  int quantidade2 = 0;
  int quantidade3 = 0;
  int quantidadeProdutos = 0;
  @override
  void initState() {
    valorTotal += price;
    quantidadeProdutos += 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.branco,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: AppColors.amarelo,
                  width: size.width,
                  height: size.height * 0.049,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      IconButtonWidget(
                          size: 15,
                          icon: AppIcon.chevronCircleUp,
                          onTap: () {}),
                      SizedBox(width: 10),
                      IconButtonWidget(
                          size: 15, icon: AppIcon.Map, onTap: () {}),
                      Text(
                        'Rua França Pinto, 406 - Vila Mariana',
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColors.cinzaEscuroFont),
                      ),
                      IconButtonWidget(
                          size: 15,
                          icon: AppIcon.chevronCircleDown,
                          onTap: () {}),
                      Spacer(),
                      IconButtonWidget(
                          size: 15, icon: AppIcon.Seach, onTap: () {}),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                imageBegindWidget(
                    size: size.height * 0.049, image: AppImages.chocolate),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      padding: const EdgeInsets.all(0.5),
                      width: 102,
                      height: 102,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(AppImages.svglogo),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            // container 1
            ImageProductWidget(image: AppImages.brigadeiro),
            Container(
                margin: const EdgeInsets.only(bottom: 1, left: 1, right: 1),
                width: 343,
                height: 86,
                decoration: const BoxDecoration(
                  color: AppColors.verde,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: nameProductDescriptionWidget(
                    icon: AppIcon.Heart,
                    onTap: () {},
                    nameProduct: 'Bombom 1',
                    DescriptionProduct: 'Doce de chocolate',
                    price: price)),
            SizedBox(
              height: 10,
            ),
            Container(
              color: AppColors.amarelo,
              width: size.width,
              height: size.height * 0.049,
              child: Row(
                children: [
                  SizedBox(width: 30),
                  Text('Adicionais',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verdeEscuroFont)),
                  Spacer(),
                  SizedBox(width: 30),
                  Text('escolha até 3 itens',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.verdeEscuroFont)),
                  SizedBox(
                    width: 17,
                  ),
                  SizedBox(
                    height: 15,
                    width: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: AppColors.vermelho),
                      child: Center(
                        child: Text('Obrigatorio',
                            style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: AppColors.branco)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                ],
              ),
            ),
            // container ADD morango

            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 17, top: 65),
                  child: AdditionalWidget(
                    sizeDbox: 155,
                    size: 60,
                    quantidade: quantidade1,
                    nomeAdicional: 'Ninho',
                    valorAdicional: valorAdicional1,
                    onAdd: () {
                      setState(() {
                        valorTotal += valorAdicional1;
                        quantidade1 += 1;
                      });
                    },
                    onSubtrair: () {
                      setState(() {
                        if (quantidade1 > 0) {
                          valorTotal -= valorAdicional1;
                          quantidade1 -= 1;
                        }
                      });
                    },
                  ),
                ),
                // container ADD Granulado
                Padding(
                  padding: EdgeInsets.only(left: 17, top: 25),
                  child: AdditionalWidget(
                    sizeDbox: 128,
                    size: 55,
                    quantidade: quantidade2,
                    nomeAdicional: 'Granulado',
                    valorAdicional: valorAdicional2,
                    onAdd: () {
                      setState(() {
                        valorTotal += valorAdicional2;
                        quantidade2 += 1;
                      });
                    },
                    onSubtrair: () {
                      setState(() {
                        if (quantidade2 > 0) {
                          valorTotal -= valorAdicional2;
                          quantidade2 -= 1;
                        }
                      });
                    },
                  ),
                ),
                // container Ninho
                Padding(
                  padding: EdgeInsets.only(left: 17),
                  child: AdditionalWidget(
                    sizeDbox: 135,
                    quantidade: quantidade3,
                    nomeAdicional: 'Morango',
                    valorAdicional: valorAdicional3,
                    onAdd: () {
                      setState(() {
                        valorTotal += valorAdicional3;
                        quantidade3 += 1;
                      });
                    },
                    onSubtrair: () {
                      setState(() {
                        if (quantidade3 > 0) {
                          valorTotal -= valorAdicional3;
                          quantidade3 -= 1;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),

            const Spacer(),
            BorderTotal(
              size_height: 66,
              size_width: size.width,
              color: AppColors.verde,
              icon: AppIcon.MinusCircle,
              priceTotal: valorTotal,
              onAdd: () {
                setState(() {
                  valorTotal += price;
                  quantidadeProdutos += 1;
                });
              },
              onSubtrair: () {
                setState(
                  () {
                    if (quantidadeProdutos > 1) {
                      valorTotal -= price;
                      quantidadeProdutos -= 1;
                    }
                  },
                );
              },
              quantidade: quantidadeProdutos,
              quantidadeAdicional: quantidade1 + quantidade2 + quantidade3,
            )
          ],
        ),
      ),
    );
  }
}
