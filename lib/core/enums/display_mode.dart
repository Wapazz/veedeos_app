import 'package:flutter/material.dart';

enum DisplayMode {
  grid,
  list,
  ;

  factory DisplayMode.fromSwitch(bool value) {
    return value ? grid : list;
  }

  int get crossAxisCount {
    return switch (this) {
      grid => 2,
      list => 1,
    };
  }

  EdgeInsets get padding {
    return switch (this) {
      grid => const EdgeInsets.all(8.0),
      list => const EdgeInsets.symmetric(vertical: 8.0),
    };
  }
}
