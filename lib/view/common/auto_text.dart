import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutoText extends StatelessWidget {
  final int _maxLine;
  final int _fontSizeSp;

  final String _text;
  final bool _removeHtml;

  final TextStyle _style;
  final Alignment _align;

  final int? _maxLength;
  final int? _minFontSizeSp;
  final TextAlign? _textAlign;

  AutoText({
    required String? text,
    required int fontSizeSp,
    int? maxLength,
    int maxLine = 1,
    int? minFontSizeSp,
    TextAlign? textAlign,
    bool removeHtml = false,
    Alignment align = Alignment.center,
    TextStyle style = const TextStyle(),
  })  : _text = text ?? "",
        _maxLength = maxLength,
        _style = style,
        _align = align,
        _maxLine = maxLine,
        _textAlign = textAlign,
        _removeHtml = removeHtml,
        _fontSizeSp = fontSizeSp,
        _minFontSizeSp = minFontSizeSp;

  @override
  Widget build(BuildContext context) {
    String text = _text;

    if (_removeHtml) {
      text = text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
    }

    if ((_maxLength != null) && (text.length > _maxLength!)) {
      text = text.substring(0, _maxLength!);
    }

    return Align(
      alignment: _align,
      child: AutoSizeText(text,
          style: _style.copyWith(
            fontSize: _fontSizeSp.sp,
          ),
          minFontSize: (_minFontSizeSp != null
              ? _minFontSizeSp!.sp.toInt().toDouble()
              : (_maxLine == 1 ? 0 : 10)),
          overflow: TextOverflow.ellipsis,
          maxLines: _maxLine,
          textAlign: _textAlign),
    );
  }

  static scaleSp(int fontSizeSp) => (fontSizeSp * 0.9).toInt().sp;
}
