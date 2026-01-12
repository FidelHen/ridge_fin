import 'package:flutter/material.dart';

class AppDimensions {
  static double get spacingNone => 0;
  static double get spacing4 => 4;
  static double get spacing6 => 6;
  static double get spacing8 => 8;
  static double get spacing12 => 12;
  static double get spacing14 => 14;
  static double get spacing16 => 16;
  static double get spacing20 => 20;
  static double get spacing24 => 24;
  static double get spacing28 => 28;
  static double get spacing32 => 32;
  static double get spacing36 => 36;
  static double get spacing40 => 40;
  static double get spacing48 => 48;
  static double get spacing56 => 56;
  static double get spacing64 => 64;
  static double get spacing72 => 72;
  static double get spacing80 => 80;
  static double get spacing88 => 88;
  static double get spacing96 => 96;
  static double get spacing104 => 104;

  static EdgeInsets getContentPadding({bool top = true, bool bottom = true}) {
    return const EdgeInsets.symmetric(horizontal: 24).copyWith(top: top ? 16 : 0, bottom: bottom ? 16 : 0);
  }
}
