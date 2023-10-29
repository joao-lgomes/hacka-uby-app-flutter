import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacka_ubyfol/theme/colors.dart';
import 'package:hacka_ubyfol/theme/typography.dart';

// ignore: non_constant_identifier_names
UbyInputDecoration({
  String? label,
  bool showLabel = false,
  bool isOptional = false,
  String? hintText,
  bool showErrorMessage = true,
  bool showCounterText = true,
  bool? isDense,
  EdgeInsetsGeometry? contentPadding,
}) {
  var styleTextErr = UbyTypographySemiBold.body_2;

  if (!showErrorMessage) {
    styleTextErr = const TextStyle(height: 0);
  }
  return InputDecoration(
    errorStyle: styleTextErr,
    errorMaxLines: 2,
    fillColor: Colors.white,
    filled: true,
    labelText: label,
    hintText: hintText,
    isDense: isDense,
    contentPadding: contentPadding,
    floatingLabelBehavior:
    (showLabel) ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
    labelStyle: UbyTypographyRegular.body_3.copyWith(color: UbyColors.b100),
    alignLabelWithHint: true,
    hintStyle: UbyTypographyRegular.body_3.copyWith(color: UbyColors.g300),
    suffixIcon: (isOptional)
        ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SvgPicture.asset('assets/icons/optional.svg'),
    )
        : null,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 1, color: UbyColors.g200),
    ),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: UbyColors.g200)),
    counterText: showCounterText ? null : '',
  );
}
