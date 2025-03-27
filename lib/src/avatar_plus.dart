import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'avatar_plus_controller.dart';
import 'avatar_plus_gen.dart';

class AvatarPlus extends StatelessWidget {
  final String? string;
  final AvatarPlusValues? values;

  final bool trBackground;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool matchTextDirection;
  final bool allowDrawingOutsideViewBox;
  final WidgetBuilder? placeholderBuilder;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final ColorFilter? colorFilter;
  final SvgTheme theme;
  final AvatarPlusController? controller;

  AvatarPlus(this.string,
      {super.key,
      this.trBackground = false,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.alignment = Alignment.center,
      this.matchTextDirection = false,
      this.allowDrawingOutsideViewBox = false,
      this.placeholderBuilder,
      this.semanticsLabel,
      this.excludeFromSemantics = false,
      this.colorFilter,
      this.theme = const SvgTheme(),
      this.controller})
      : values = null;

  AvatarPlus.fromValues(this.values,
      {super.key,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.alignment = Alignment.center,
      this.matchTextDirection = false,
      this.allowDrawingOutsideViewBox = false,
      this.placeholderBuilder,
      this.semanticsLabel,
      this.excludeFromSemantics = false,
      this.colorFilter,
      this.theme = const SvgTheme(),
      this.controller})
      : string = null,
        trBackground = false;

  @override
  Widget build(BuildContext context) {
    String svgString = generate();
    controller?.svgString = svgString;
    return SvgPicture.string(
      svgString,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter,
      theme: theme,
    );
  }

  String generate() {
    if (string == null) {
      return AvatarPlusGen.instance.generateFromValues(
        values!,
      );
    } else {
      return AvatarPlusGen.instance.generate(
        string!,
        trBackground: trBackground,
      );
    }
  }
}

/// Can be used to define individual feature values for an avatar.
/// Each feature int should be between 0-47. Greater values will be
/// converted to the range 0-47 using modulo.
///
/// If null, the feature will be excluded from the generated avatar.
class AvatarPlusValues {
  final int? env;
  final int? clo;
  final int? head;

  final int? mouth;
  final int? eyes;
  final int? top;

  const AvatarPlusValues({
    this.env,
    this.clo,
    this.head,
    this.mouth,
    this.eyes,
    this.top,
  });
}
