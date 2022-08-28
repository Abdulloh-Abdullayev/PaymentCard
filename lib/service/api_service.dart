import 'dart:io';

import 'package:dio/dio.dart';
import 'package:payment_card/service/base_model.dart';

class ApiService {
  static Future GET<T extends BaseModel>(String path, T model) async {
    Response res = await Dio().get(path);
    switch (res.statusCode) {
      case HttpStatus.ok:
        var responseBody = res.data;
        if (responseBody is List) {
          print(responseBody);
          var data = responseBody.map((e) => model.fromJson(e)).toList();
          return data;
        } else if (responseBody is Map) {
          return model.fromJson(responseBody);
        } else {
          return responseBody;
        }
      case HttpStatus.internalServerError:
        return HttpStatus.internalServerError;
    }
  }

  static Future PUT({required String path, required dynamic data}) async {
    try {
      Response res = await Dio().put(path, data: data);
      print(res.data);
      return res.data.toString();
    } catch (e) {
      print(e);
      return e;
    }
  }
}
