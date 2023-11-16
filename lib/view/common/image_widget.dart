import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidgetOnTap {
  final BuildContext _context;
  final List<String> _imageUrls;

  final VoidCallback? _onCreate;
  final VoidCallback? _onDismiss;

  ImageWidgetOnTap(
      {required BuildContext context,
      required List<String?> imageUrls,
      required int start,
      VoidCallback? onCreate,
      VoidCallback? onDismiss})
      : _context = context,
        _onCreate = onCreate,
        _onDismiss = onDismiss,
        _imageUrls = ImageWidget._extractValidImageUrls(
            ImageWidget._arrangeImageUrls(imageUrls, start));
}

class ImageWidget extends StatelessWidget {
  final double _width;
  final double _height;
  final double _radius;
  final String _imageUrl;

  final BoxFit _fit;
  final ImageWidgetOnTap? _onTap;
  final Function? _onTabVoid;
  final Color? _color;
  final bool? _useColor;

  /// prefix for fixed image auto update

  ImageWidget(
      {required String imageUrl,
      required double width,
      required double height,
      double radius = 4,
      String? defaultUrl,
      ImageWidgetOnTap? onTap,
      Function? onTabVoid,
      Color? color,
      bool? useColor,
      BoxFit fit = BoxFit.cover})
      : _imageUrl = imageUrl,
        _fit = fit,
        _onTap = onTap,
        _onTabVoid = onTabVoid,
        _radius = radius,
        _width = width,
        _height = height,
        _color = color,
        _useColor = useColor ?? true;

  /// prefix for fixed image auto update

  ImageWidget.constraints(
      {required String imageUrl,
      required BoxConstraints constraints,
      double radius = 4,
      ImageWidgetOnTap? onTap,
      Function? onTabVoid,
      Color? color,
      bool? useColor,
      BoxFit fit = BoxFit.cover})
      : _imageUrl = imageUrl,
        _fit = fit,
        _onTap = onTap,
        _onTabVoid = onTabVoid,
        _width = constraints.maxWidth,
        _radius = radius,
        _height = constraints.maxHeight,
        _color = color,
        _useColor = useColor ?? false;

  @override
  Widget build(BuildContext context) {
    Widget child = CachedNetworkImage(
        fit: _fit,
        width: _width,
        height: _height,
        imageUrl: _imageUrl,
        useOldImageOnUrlChange: false,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(_radius)),
                  image: DecorationImage(image: imageProvider, fit: _fit)),
            ),
        errorWidget: (_, __, ___) {
          return Container(
            color: Colors.grey[400],
          );
        });

    if (_onTap != null) {
      return InkWell(
        onTap: () async {
          if (_onTap!._onCreate != null) {
            _onTap!._onCreate!();
          }
          if (_onTap!._onDismiss != null) {
            _onTap!._onDismiss!();
          }
        },
        child: child,
      );
    } else if (_onTabVoid != null) {
      return InkWell(
        onTap: () => _onTabVoid!(),
        child: child,
      );
    } else {
      return child;
    }
  }

  static List<String?> _arrangeImageUrls(List<String?> imageUrls, int start) {
    if (imageUrls.isNotEmpty) {
      List<String?> arranged = [];

      arranged.addAll(imageUrls.sublist(start));
      if (start > 0) {
        arranged.addAll(imageUrls.sublist(0, start));
      }

      return arranged;
    } else {
      return [];
    }
  }

  static List<String> _extractValidImageUrls(List<String?> expandWith) {
    List<String> results = [];

    for (String? imageUrl in expandWith) {
      if ((imageUrl != null) && imageUrl.trim().isNotEmpty) {
        results.add(imageUrl);
      }
    }

    return results;
  }
}
