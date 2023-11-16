import 'package:flutter/material.dart';

typedef SectionBuilder = List<Widget> Function(
    Size designSize, BoxConstraints full, BoxConstraints trim);

class Section extends StatelessWidget {
  final Size _designSize;
  final SectionBuilder? _builder;

  final Color? _color;
  final Decoration? _decoration;
  final EdgeInsets _relativePadding;

  final StackFit _stackFit;
  final AlignmentGeometry _stackAlign;

  final bool _ignorePointer;
  final GestureTapCallback? _onTap;

  Section(
      {required Size designSize,
      SectionBuilder? builder,
      GestureTapCallback? onTap,
      bool ignorePointer = false,
      Color? color,
      Decoration? decoration,
      EdgeInsets relativePadding = EdgeInsets.zero,
      StackFit stackFit = StackFit.loose,
      AlignmentGeometry stackAlign = AlignmentDirectional.topStart})
      : assert(color == null || decoration == null),
        _onTap = onTap,
        _builder = builder,
        _designSize = designSize,
        _decoration = decoration,
        _relativePadding = relativePadding,
        _color = color,
        _stackFit = stackFit,
        _stackAlign = stackAlign,
        _ignorePointer = ignorePointer;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _designSize.width / _designSize.height,
      child: IgnorePointer(
        ignoring: _ignorePointer,
        child: (_builder == null)
            ? Container(
                color: _color,
              )
            : LayoutBuilder(builder: (_, constraints) {
                if (_onTap != null) {
                  return Card(
                    elevation: 0,
                    color: _color,
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: InkWell(
                      onTap: _onTap,
                      child: _buildContent(constraints),
                    ),
                  );
                } else {
                  return _buildContent(constraints, color: _color);
                }
              }),
      ),
    );
  }

  Widget _buildContent(BoxConstraints full, {Color? color}) {
    return Container(
      color: color,
      decoration: _decoration,
      padding: EdgeInsets.only(
        top: full.maxHeight * (_relativePadding.top / _designSize.height),
        left: full.maxWidth * (_relativePadding.left / _designSize.width),
        right: full.maxWidth * (_relativePadding.right / _designSize.width),
        bottom: full.maxHeight * (_relativePadding.bottom / _designSize.height),
      ),
      child: LayoutBuilder(builder: (_, trim) {
        return Stack(
          alignment: _stackAlign,
          fit: _stackFit,
          clipBehavior: Clip.antiAlias,
          children: _builder!(_designSize, full, trim),
        );
      }),
    );
  }
}
