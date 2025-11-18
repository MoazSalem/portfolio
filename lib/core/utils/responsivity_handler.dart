import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/sizes.dart';

/// A class that will handle text size responsivity for the whole app
/// it assumes that the user will follow material design theming guidelines
/// specially text theming.
class ResponsivityHandler extends StatefulWidget {
  const ResponsivityHandler({super.key, required this.child});
  final Widget child;

  @override
  State<ResponsivityHandler> createState() => _ResponsivityHandlerState();
}

class _ResponsivityHandlerState extends State<ResponsivityHandler> {
  ScreenSize? _lastSize;
  TextTheme? _cachedTextTheme;
  double? _scaleFactor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentSize = getSize(context);
    _cachedTextTheme = Theme.of(context).textTheme;

    // Only rebuild if screen size actually changed
    if (currentSize != _lastSize) {
      _lastSize = currentSize;
      _scaleFactor = getScaleFactor(currentSize);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: _cachedTextTheme?.apply(fontSizeFactor: _scaleFactor ?? 1.0),
      ),
      child: widget.child,
    );
  }
}

/// An enum for different screen sizes
enum ScreenSize { small, normal, large, extraLarge }

/// A Function to get the current screen size
ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > AppSizes.extraLargeDeviceBreakpoint) {
    return ScreenSize.extraLarge;
  }
  if (deviceWidth > AppSizes.largeDeviceBreakpoint) return ScreenSize.large;
  if (deviceWidth > AppSizes.normalDeviceBreakpoint) return ScreenSize.normal;
  return ScreenSize.small;
}

/// A Function to change text scale according to the screen size
double getScaleFactor(ScreenSize size) {
  switch (size) {
    case ScreenSize.small:
      return AppSizes.smallFontScaleFactor;
    case ScreenSize.normal:
      return AppSizes.normalFontScaleFactor;
    case ScreenSize.large:
      return AppSizes.largeFontScaleFactor;
    case ScreenSize.extraLarge:
      return AppSizes.extraLargeFontScaleFactor;
  }
}
