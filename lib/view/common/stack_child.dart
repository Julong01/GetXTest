import 'package:auction/view/common/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StackChild extends StatelessWidget {
  final double? _width;
  final double? _height;
  final double? _top;
  final double? _bottom;
  final double? _start;
  final double? _end;
  final bool _visible;
  final Color _color;
  final Curve _curve;
  final bool _ripple;
  final double _elevation;
  final EdgeInsets _margin;
  final Duration _duration;
  final ShapeBorder? _shape;
  final bool _ignorePointer;
  final Decoration? _decoration;
  final GestureTapCallback? _onTap;

  final Widget Function(BoxConstraints constraints) _builder;

  static horizontalCenter(double width) => (0.5.sw - (width / 2));
  static horizontalRelativeCenter(
      BoxConstraints constraints, double width, double designWidth) {
    return (constraints.maxWidth -
            (width * (constraints.maxWidth / designWidth))) /
        2;
  }

  StackChild({
    double? width,
    double? top,
    double? bottom,
    double? start,
    double? end,
    double? height,
    required Widget Function(BoxConstraints constraints) builder,
    bool ripple = true,
    bool visible = true,
    double elevation = 0,
    Decoration? decoration,
    GestureTapCallback? onTap,
    bool ignorePointer = false,
    Color color = Colors.transparent,
    EdgeInsets margin = EdgeInsets.zero,
    Curve curve = Curves.fastLinearToSlowEaseIn,
    Duration duration = const Duration(milliseconds: 250),
    ShapeBorder shape =
        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  })  : _width = width,
        _height = height,
        _top = top,
        _bottom = bottom,
        _end = end,
        _start = start,
        _builder = builder,
        _curve = curve,
        _color = color,
        _onTap = onTap,
        _shape = shape,
        _ripple = ripple,
        _margin = margin,
        _visible = visible,
        _duration = duration,
        _elevation = elevation,
        _decoration = decoration,
        _ignorePointer = ignorePointer;

  StackChild.relative({
    required Size designSize,
    required BoxConstraints constraints,
    double? width,
    double? top,
    double? bottom,
    double? start,
    double? end,
    double? height,
    required Widget Function(BoxConstraints constraints) builder,
    bool widthUsingHeight = false,
    bool startUsingHeight = false,
    bool endUsingHeight = false,
    bool ripple = true,
    bool visible = true,
    double elevation = 0,
    Decoration? decoration,
    GestureTapCallback? onTap,
    bool ignorePointer = false,
    Color color = Colors.transparent,
    EdgeInsets margin = EdgeInsets.zero,
    Curve curve = Curves.fastLinearToSlowEaseIn,
    Duration duration = const Duration(milliseconds: 250),
    ShapeBorder shape =
        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  })  : _width = (width == null
            ? null
            : widthUsingHeight
                ? (width * (constraints.maxHeight / designSize.height))
                : (width * (constraints.maxWidth / designSize.width))),
        _height = (height == null
            ? null
            : height * (constraints.maxHeight / designSize.height)),
        _top = (top == null
            ? null
            : (top * ((constraints.maxHeight / designSize.height)))),
        _bottom = (bottom == null
            ? null
            : (bottom * (constraints.maxHeight / designSize.height))),
        _end = (end == null
            ? null
            : endUsingHeight
                ? (end * (constraints.maxHeight / designSize.height))
                : (end * (constraints.maxWidth / designSize.width))),
        _start = (start == null
            ? null
            : startUsingHeight
                ? (start * (constraints.maxHeight / designSize.height))
                : (start * (constraints.maxWidth / designSize.width))),
        _builder = builder,
        _curve = curve,
        _color = color,
        _onTap = onTap,
        _shape = shape,
        _ripple = ripple,
        _margin = margin,
        _visible = visible,
        _duration = duration,
        _elevation = elevation,
        _decoration = decoration,
        _ignorePointer = ignorePointer;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositionedDirectional(
        width: _width,
        height: _height,
        top: _top,
        bottom: _bottom,
        start: _start,
        end: _end,
        curve: _curve,
        duration: _duration,
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          curve: _curve,
          duration: _duration,
          child: BaseWidget(
            color: _color,
            onTap: _onTap,
            shape: _shape,
            ripple: _ripple,
            visible: _visible,
            elevation: _elevation,
            decoration: _decoration,
            ignorePointer: _ignorePointer,
            margin: _margin,
            builder: _builder,
          ),
        ));
  }
}
