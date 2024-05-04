import 'package:flutter/material.dart';

class CustomTextStatus extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPassword;

  const CustomTextStatus({
    Key? key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextStatusState createState() => _CustomTextStatusState();
}

class _CustomTextStatusState extends State<CustomTextStatus> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = !widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        textAlign: TextAlign.start, // Changed to start to match the image
        obscureText: widget.isPassword && !_isPasswordVisible,
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true, // new line
          fillColor: Colors.grey
              .shade200, // new line, change this to match the exact color you need
          contentPadding: EdgeInsets.symmetric(
              vertical: 18.0, horizontal: 16.0), // Adjusted the padding
          border: OutlineInputBorder(
            // Changed to an outline border
            borderSide: BorderSide.none, // Set border to none
            borderRadius: BorderRadius.circular(
                10.0), // Adjust the border radius to match the image
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
