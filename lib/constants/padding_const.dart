import 'package:template/template.dart';

extension EdgeInsetsX on EdgeInsets {
  EdgeInsets pVer(double value) => copyWith(top: value, bottom: value);
  EdgeInsets pHor(double value) => copyWith(left: value, right: value);
  EdgeInsets pTop(double value) => copyWith(top: value);
  EdgeInsets pLeft(double value) => copyWith(left: value);
  EdgeInsets pRight(double value) => copyWith(right: value);
  EdgeInsets pBot(double value) => copyWith(bottom: value);
}

class NumConst {
  static num get pt4 => 4;
  static num get pt8 => 8;
  static num get pt16 => 16;
  static num get pt24 => 24;
  static num get pt32 => 32;
  static num get pt36 => 36;
  static num get pt40 => 40;
  static num get pt48 => 48;
  static num get pt52 => 52;
  static num get pt56 => 56;
  static num get pt60 => 60;
}

class PConst {
  static EdgeInsets side(
          {required double vertical, required double horizontal}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  static EdgeInsets all({required double padding}) => EdgeInsets.all(padding);

  static EdgeInsets get pv8 => side(vertical: 8, horizontal: 0);
  static EdgeInsets get ph8 => side(vertical: 0, horizontal: 8);

  static Widget get h4 => const SizedBox(height: 4);
  static Widget get h8 => const SizedBox(height: 8);
  static Widget get h16 => const SizedBox(height: 16);
  static Widget get h24 => const SizedBox(height: 24);
  static Widget get h32 => const SizedBox(height: 32);
  static Widget get h36 => const SizedBox(height: 36);
  static Widget get h40 => const SizedBox(height: 40);
  static Widget get h48 => const SizedBox(height: 48);
  static Widget get h52 => const SizedBox(height: 52);
  static Widget get h56 => const SizedBox(height: 56);
  static Widget get h60 => const SizedBox(height: 60);

  static Widget get w4 => const SizedBox(width: 4);
  static Widget get w8 => const SizedBox(width: 8);
  static Widget get w16 => const SizedBox(width: 16);
  static Widget get w24 => const SizedBox(width: 24);
  static Widget get w32 => const SizedBox(width: 32);
  static Widget get w36 => const SizedBox(width: 36);
  static Widget get w40 => const SizedBox(width: 40);
  static Widget get w48 => const SizedBox(width: 48);
  static Widget get w52 => const SizedBox(width: 52);
  static Widget get w56 => const SizedBox(width: 56);
  static Widget get w60 => const SizedBox(width: 60);
}
