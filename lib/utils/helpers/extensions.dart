import 'package:flutter/material.dart';

import '../common_widgets/fade_in_widget.dart';

extension Context on BuildContext {
  double sh({double size = 1.0}) {
    return MediaQuery.of(this).size.height * size;
  }

  double sw({double size = 1.0}) {
    return MediaQuery.of(this).size.width * size;
  }

  int cacheSize(double size) {
    return (size * MediaQuery.of(this).devicePixelRatio).round();
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    } else {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
  }
}

extension OpacityColorExtension on Color {
  Color mimicOpacityColor(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0,
        'Opacity must be between 0.0 and 1.0');
    return withAlpha((opacity * 255).round());
  }
}

extension FadeInExtension on Widget {
  Widget fadeIn(
      {Duration duration = const Duration(seconds: 2),
      Curve curve = Curves.easeIn}) {
    return FadeInWidget(
      duration: duration,
      curve: curve,
      child: this,
    );
  }
}

extension StringCasingExtension on String {
  String capitalizeEachLetter() {
    if (trim().isEmpty) return '';
    return split(' ').map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
