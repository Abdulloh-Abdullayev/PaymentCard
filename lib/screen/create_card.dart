import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payment_card/core/constants/color_const.dart';
import 'package:payment_card/core/constants/navigation_const.dart';
import 'package:payment_card/core/data/list_locale.dart';
import 'package:payment_card/core/extensions/size_extension.dart';
import 'package:payment_card/model/api_model.dart';
import 'package:payment_card/screen/cubit/api_cubit.dart';
import 'package:payment_card/screen/cubit/api_state.dart';
import 'package:payment_card/service/api_service.dart';
import 'package:payment_card/widget/card_container.dart';

class CreatePage extends StatefulWidget {
  final ApiModel card;
  const CreatePage({Key? key, required this.card}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCubit(),
      child: BlocConsumer<ApiCubit, ApiState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _myScaffold(context);
        },
      ),
    );
  }

  WillPopScope _myScaffold(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, NavigationConst.CARD_PAGE, (route) => false);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, NavigationConst.CARD_PAGE, (route) => false);
            },
          ),
          backgroundColor: ColorConst.orange,
          title: Text("Create Card", style: TextStyle(color: Colors.white)),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardContainer(
                color: context.watch<ApiCubit>().apiColor,
                image: context.watch<ApiCubit>().imagePath,
                cardName: widget.card.cardName!,
                cardNumber: widget.card.cardNumber!,
                price: widget.card.price,
                title: widget.card.title!,
                cardDate: widget.card.cardDate!,
              ),
              SizedBox(height: context.h * 0.2),
              for (var i = 0; i < 3; i++)
                GestureDetector(
                  onTap: () {
                    ontap(i, context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: context.h * 0.02,
                        vertical: context.h * 0.01),
                    height: context.h * 0.09,
                    width: context.w * 0.94,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: i != 2
                          ? Color.fromARGB(255, 227, 223, 223)
                          : ColorConst.orange,
                    ),
                    child: Center(
                      child: Text(buttonText[i], style: TextStyle(
                        color: i != 2? Colors.black:Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future ontap(int i, BuildContext contextt) async {
    if (i == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              height: contextt.h * 0.9,
              padding: EdgeInsets.all(context.h * 0.02),
              width: context.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ColorPicker(
                      pickerColor: contextt.watch<ApiCubit>().pickerColor,
                      onColorChanged: (v) {
                        contextt.read<ApiCubit>().changeColor(v);
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        contextt.read<ApiCubit>().colorChangeString();
                        Navigator.pop(context);
                      },
                      child: Text("Ok"),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else if (i == 1) {
      contextt.read<ApiCubit>().imageFile();
    } else {
      contextt.read<ApiCubit>().apiPut(widget.card.id!).then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, NavigationConst.CARD_PAGE, (route) => false);
      });
    }
  }
}
