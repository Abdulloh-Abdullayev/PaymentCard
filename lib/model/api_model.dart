import 'package:payment_card/service/base_model.dart';

class ApiModel extends BaseModel {
    ApiModel({
        this.createdAt,
        this.title,
        this.price,
        this.cardNumber,
        this.cardDate,
        this.cardName,
        this.color,
        this.image,
        this.id,
    });

    int? createdAt;
    String? title;
    dynamic price;
    int? cardNumber;
    String? cardDate;
    String? cardName;
    dynamic color;
    dynamic image;
    String? id;

    @override
      Map<String, Object> toJson() => {
        "createdAt": createdAt!,
        "title": title!,
        "price": price!,
        "cardNumber": cardNumber!,
        "cardDate": cardDate!,
        "cardName": cardName!,
        "color": color!,
        "image": image!,
        "id": id!,
    };
    
      @override
      fromJson(Map json) {
         return ApiModel(
        createdAt: json["createdAt"],
        title: json["title"],
        price: json["price"],
        cardNumber: json["cardNumber"],
        cardDate: json["cardDate"],
        cardName: json["cardName"],
        color: json["color"],
        image: json["image"],
        id: json["id"],
    );

      }
}
