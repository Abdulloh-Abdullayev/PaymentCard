
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_card/core/constants/navigation_const.dart';
import 'package:payment_card/model/api_model.dart';
import 'package:payment_card/screen/card_page.dart';
import 'package:payment_card/screen/create_card.dart';

class Routers {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case NavigationConst.CARD_PAGE:
        return MaterialPageRoute(builder: (context) => CardPage());
      case NavigationConst.CARD_SET_PAGE:
        return MaterialPageRoute(builder: (context) => CreatePage(card: args as ApiModel,));
       
    }
  }

  
}
