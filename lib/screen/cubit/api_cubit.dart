import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payment_card/screen/cubit/api_state.dart';
import 'package:payment_card/service/api_service.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());

  Color pickerColor = Color(0xff443a49);
  String apiColor = "#443a49";
  final ImagePicker picker = ImagePicker();
  File file = File("");
  String imagePath = '';

  void changeColor(Color color) {
    pickerColor = color;
    emit(ColorState());
  }

  void colorChangeString() {
    apiColor = "#${pickerColor.toString().split("xff")[1].split(")")[0]}";
    imagePath = '';
    emit(ColorState());
  }

  void initColor({required String image, required String color}) {
    apiColor = color;
    imagePath = image;
    emit(ColorState());
  }

  void colorPath() {}
  Future apiPut(String id) async {
    ApiService.PUT(
      path: "https://630affcef280658a59d48cd3.mockapi.io/data/${id}",
      data: {
        'color': apiColor,
        'image': imagePath,
      },
    );
  }

  Future imageFile() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    imagePath = file.path;
    emit(ColorState());
  }
}
