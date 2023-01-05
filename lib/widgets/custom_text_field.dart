import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.prefixIcon,
    required this.formFieldKey,
    this.isReadOnly = false,
    this.keyboardType,
  }) : super(key: key);

  final String labelText;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final GlobalKey<FormFieldState> formFieldKey;
  final bool isReadOnly;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.labelText),
        const SizedBox(height: 8),
        TextFormField(
          key: widget.formFieldKey,
          controller: widget.controller,
          readOnly: widget.isReadOnly,
          keyboardType: widget.keyboardType,
          maxLines: null,
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
            hintText: widget.labelText,
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
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }
}
