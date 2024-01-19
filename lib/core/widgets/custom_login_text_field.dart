import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoginTextField extends StatefulWidget {
  final TextEditingController? controller;

  final String stringInTextField;
  final bool obscureText;
  final TextInputType textInputType;
  final double? height;
  final double? width;
  final int? multiLine;
  final String? Function(String?)? validator;
  final String? imagePath;

  const CustomLoginTextField({
    Key? key,
    this.width,
    this.imagePath,
    this.multiLine,
    required this.stringInTextField,
    required this.textInputType,
    required this.obscureText,
    this.height,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: widget.width != null ? 0 : 30),
      child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
          controller: widget.controller,
          //   textAlign: TextAlign.right,
          validator: widget.validator,
          obscureText: widget.obscureText ? obscure : false,
          keyboardType: widget.textInputType,
          maxLines: widget.multiLine ?? 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            label: Text(
              widget.stringInTextField,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Color(0xff9d9d9e),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 35, minHeight: 0),

            prefixIcon: widget.imagePath != null
                ? Image.asset(
                    widget.imagePath!,
                    scale: 1,
                  )
                : const SizedBox(),

            suffix: widget.obscureText
                ? InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(
                        obscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                        color: Colors.grey),
                  )
                : const SizedBox(),
            errorStyle: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 10,
              height: .7,
            ),
            filled: true,
            // focusedErrorBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5, horizontal: 10), // space of text
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff707070),
                width: 1.0,
              ),

              // border: Border.all(color: const Color(0xff707070)),
              //  color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff707070),
                width: .5,
              ),

              // border: Border.all(color: const Color(0xff707070)),
              //  color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
            ),
            errorMaxLines: 1,

            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff707070),
                width: .5,
              ),

              // border: Border.all(color: const Color(0xff707070)),
              //  color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: .5,
              ),

              // border: Border.all(color: const Color(0xff707070)),
              //  color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),

              // border: Border.all(color: const Color(0xff707070)),
              //  color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }
}
