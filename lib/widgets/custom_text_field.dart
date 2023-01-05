import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.onFieldSubmitted,
      this.validator,
      this.controller,
      this.prefixIcon,
      required this.formFieldKey})
      : super(key: key);

  final String? hintText;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final GlobalKey<FormFieldState> formFieldKey;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.formFieldKey,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: _errorMessage != null
            ? Tooltip(
                message: _errorMessage,
                triggerMode: TooltipTriggerMode.tap,
                preferBelow: false,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: const Icon(
                  Icons.info,
                  color: Colors.red,
                ),
              )
            : null,
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(
          // Hacky way to hide default error
          height: 0.01,
          color: Colors.transparent,
          fontSize: 0,
        ),
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value) {
        if (widget.validator != null) {
          final errorMessage = widget.validator!(value);
          setState(() {
            _errorMessage = errorMessage;
          });

          return _errorMessage;
        }

        return null;
      },
    );
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }
}
