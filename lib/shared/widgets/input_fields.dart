import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    this.labelText,
    this.helperText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.focus = false,
    this.readOnly = false,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool focus;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final Function(String)? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText == null
            ? const SizedBox.shrink()
            : Text(widget.labelText!),
        widget.labelText == null ? const SizedBox.shrink() : const Gap(8.0),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          autofocus: widget.focus,
          textCapitalization: widget.textCapitalization,
          readOnly: widget.readOnly,
          // autofocus: true,
          maxLength: widget.maxLength,
          style: const TextStyle(fontSize: 15.0),
          decoration: InputDecoration(
            // labelText: widget.labelText,
            helperText: widget.helperText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            hintText: widget.hintText ?? widget.labelText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline),
            suffixIcon: widget.suffixIcon,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.surfaceTint.withOpacity(0.1),
              ),
            ),
          ),
          validator: widget.validator,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
