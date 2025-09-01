class ScreenModel {
  final double width;
  ScreenModel(this.width);

  bool get isSmallScreen => width < 600; // simple rule
}
