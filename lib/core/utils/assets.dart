class AppAssets {
  const AppAssets._();

  // Svgs
  static const String _svgBase = "images/svgs";

  static String getSvgByName(String name) {
    return "$_svgBase/$name.svg.vec";
  }
}
