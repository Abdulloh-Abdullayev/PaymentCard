import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payment_card/core/extensions/size_extension.dart';

class CardContainer extends StatelessWidget {
  final String title;
  final String price;
  final int cardNumber;
  final String cardName;
  final String cardDate;
  final String image;
  final String color;
  const CardContainer(
      {Key? key,
      required this.image,
      required this.cardName,
      required this.cardNumber,
      required this.price,
      required this.title,
      required this.color,
      required this.cardDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.h * 0.02, vertical: context.w * 0.02),
      height: context.h * 0.29,
      width: context.w * 0.98,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(File(image)),
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.purple,
      ),
      child: Container(
        padding: EdgeInsets.all(context.w * 0.025),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: image == ""? hexToColor(color) : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: context.w * 0.01),
                  padding: EdgeInsets.symmetric(
                      horizontal: context.h * 0.015,
                      vertical: context.w * 0.01),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 21, 2, 2).withOpacity(0.5)),
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              height: context.h * 0.2,
              width: context.w * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 5, 2, 16).withOpacity(0.35)),
              padding: EdgeInsets.all(context.h * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(price,
                      style: TextStyle(color: Colors.white, fontSize: 23)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardNumber.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        cardDate,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )
                    ],
                  ),
                  Text(cardName,
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    print(Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000));
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
