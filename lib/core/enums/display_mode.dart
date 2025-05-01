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
}
