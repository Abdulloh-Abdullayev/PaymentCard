import 'package:flutter/cupertino.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get h => mq.size.height;
  double get w => mq.size.width;
}
