import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payment_card/core/constants/color_const.dart';
import 'package:payment_card/core/constants/navigation_const.dart';
import 'package:payment_card/model/api_model.dart';
import 'package:payment_card/service/api_service.dart';
import 'package:payment_card/widget/card_container.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.orange,
        title: Text("Card Page", style: TextStyle(color: Colors.white)),
        elevation: 1,
      ),
      body: FutureBuilder(
        future: ApiService.GET(
            "https://630affcef280658a59d48cd3.mockapi.io/data", ApiModel()),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Not Data"),
            );
          } else {
          
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: CardContainer(
                    image: snapshot.data[index].image!,
                    cardDate: snapshot.data[index].cardDate!,
                    cardName: snapshot.data[index].cardName!,
                    cardNumber:snapshot.data[index].cardNumber!,
                    price: snapshot.data[index].price.toString(),
                    title: snapshot.data[index].title!,
                    color: snapshot.data[index].color,
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, NavigationConst.CARD_SET_PAGE, arguments: snapshot.data[index]);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
