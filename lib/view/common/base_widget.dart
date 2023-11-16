import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  final Color _color;
  final bool _ripple;
  final bool _visible;
  final double _elevation;
  final ShapeBorder? _shape;

  final EdgeInsets _margin;
  final bool _ignorePointer;
  final Decoration? _decoration;
  final GestureTapCallback? _onTap;

  final Widget Function(BoxConstraints constraints) _builder;
  // final Widget _child;

  const BaseWidget(
      {required Widget Function(BoxConstraints constraints) builder,
      // required Widget child,

      bool ripple = true,
      bool visible = true,
      bool ignorePointer = false,
      double elevation = 0,
      Decoration? decoration,
      GestureTapCallback? onTap,
      Color color = Colors.transparent,
      EdgeInsets margin = EdgeInsets.zero,
      ShapeBorder? shape =
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero)})
      : _builder = builder,
        // _child = child,

        _color = color,
        _onTap = onTap,
        _shape = shape,
        _margin = margin,
        _ripple = ripple,
        _visible = visible,
        _elevation = elevation,
        _decoration = decoration,
        _ignorePointer = ignorePointer;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_visible || _ignorePointer,
      child: _decoration != null
          ? Container(
              decoration: _decoration,
              child: _buildCard(),
            )
          : _buildCard(),
    );
  }

  Widget _buildCard() {
    return Card(
      color: _color,
      shape: _shape,
      margin: _margin,
      elevation: _elevation,
      clipBehavior: Clip.antiAlias,
      child: _onTap != null
          ? _buildInkWell()
          : LayoutBuilder(builder: (_, constraints) => _builder(constraints)),
    );
  }

  Widget _buildInkWell() {
    if (_ripple) {
      return InkWell(
          onTap: _onTap,
          excludeFromSemantics: true,
          child: LayoutBuilder(
              builder: (_, constraints) => _builder(constraints)));
    } else {
      return InkWell(
          onTap: _onTap,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          excludeFromSemantics: true,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          child: LayoutBuilder(
              builder: (_, constraints) => _builder(constraints)));
    }
  }
}
