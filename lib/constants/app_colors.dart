import 'package:flutter/material.dart';

class AppColors {
  static final Color black = HexColor.fromHex('2C2927');
  static final Color bgBlack = HexColor.fromHex('22201F');
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String input) {
    final StringBuffer buffer = StringBuffer();
    late String hexStringColor = input;
    double opacity = 1;
    if(input.length == 8 || input.length == 9){
      hexStringColor = input.replaceRange(input.length-2, input.length, '');
      opacity = int.parse('${input[input.length-2]}${input[input.length-1]}', radix: 16) / 255;
    }
    buffer.write('ff');
    buffer.write(hexStringColor.replaceFirst('#', ''));
    final int temp = int.parse(buffer.toString(), radix: 16);
    return Color(temp).withOpacity(opacity);
  }

  String toHex() {
    return '#${value.toRadixString(16).substring(2, 8).toUpperCase()}';
  }
}