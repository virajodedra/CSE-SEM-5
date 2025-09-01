class FontModel{
  final double width;

  FontModel(this.width);

  double get fontSize {
    if( width < 400 ) return 14;
    if( width < 850 ) return 20;
    return 34;
  }
}