import 'package:flutter/services.dart';
import 'package:ninjaa/utils/common_library.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? prefix;
  final String? label;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  // final void Function(String) onChanged;
  // final FocusNode focusNode;
  const CustomTextField({
    super.key,
    this.style,
    this.inputFormatter,
    this.onTap,
    this.enabled,
    this.contentPadding,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.prefix,
    // required this.onChanged,
    // required this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      enabled: enabled,
      onTap: onTap,

      // focusNode: focusNode,

      inputFormatters: inputFormatter,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: 10,
      // onChanged: onChanged,
      decoration: InputDecoration(
          counterText: '',
          hintStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
          hintText: label,
          prefix: prefix,
          contentPadding: contentPadding,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12.sp))),
    );
  }
}
