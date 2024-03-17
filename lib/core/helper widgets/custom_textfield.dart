import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:citizen_sphere2/core/constants/colors.dart';
import 'package:citizen_sphere2/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: quickSandNormalText(
          text: 'Email',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color:
              AdaptiveTheme.of(context).mode.isLight ? blackColor : whiteColor,
        ),
        hintText: 'user123@gmail.com',
        hintStyle: quickSandStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color:
              AdaptiveTheme.of(context).mode.isLight ? blackColor : whiteColor,
          // color: darkGreyColor,
        ),
        contentPadding: EdgeInsets.only(left: 10.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(),
        ),
        suffixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                .hasMatch(value.toString()) ==
            false) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField(
      {super.key,
      required this.controller,
      required this.isConfirmPassword,
      this.confirmPasswordController,
      this.label});

  final TextEditingController controller;
  final TextEditingController? confirmPasswordController;
  final String? label;

  final bool isConfirmPassword;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  var _isObscure = true;

  void togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        label: quickSandNormalText(
          text: widget.label ?? 'Password',
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color:
              AdaptiveTheme.of(context).mode.isLight ? blackColor : whiteColor,
          // color: Theme.of(context).colorScheme.inversePrimary,
        ),
        // hintText: '*********',
        // hintStyle: quickSandStyle(
        //   fontSize: 15.sp,
        //   fontWeight: FontWeight.normal,
        //   // color: darkGreyColor,
        // ),
        contentPadding: EdgeInsets.only(left: 10.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(),
        ),
        suffixIcon: IconButton(
          onPressed: togglePasswordVisibility,
          icon: Icon(
            _isObscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
      autocorrect: false,
      obscureText: _isObscure,
      obscuringCharacter: '*',
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        if (value == null || value.trim().length < 8) {
          return 'Password must contain 8 characters';
        }
        if (widget.isConfirmPassword == true &&
            widget.controller.text != widget.confirmPasswordController!.text) {
          return 'Password does not match';
        }
        return null;
      },
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.validator,
    this.onChanged,
    this.onTap,
    required this.keyboardType,
    required this.controller,
    this.hintext,
    this.maxlines,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    required this.isRequired,
    required this.isObscure,
    this.width,
  });
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? hintext;
  final String label;
  final int? maxlines;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final bool isRequired;
  final bool isObscure;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          label: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.label,
                  style: quickSandStyle(
                    fontSize: 14.sp,
                    color: AdaptiveTheme.of(context).mode.isLight
                        ? blackColor
                        : whiteColor,
                  ),
                ),
                if (widget.isRequired)
                  WidgetSpan(
                    child: quickSandNormalText(
                      text: ' *',
                      fontSize: 14.sp,
                      color: redStarColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          hintText: widget.hintext,
          hintStyle: quickSandStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
            color: AdaptiveTheme.of(context).mode.isLight
                ? blackColor
                : whiteColor,
            // color: darkGreyColor,
          ),
          contentPadding: EdgeInsets.only(left: 10.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(),
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
        autocorrect: false,
        obscureText: widget.isObscure,
        maxLines: widget.maxlines,
        obscuringCharacter: '*',
        textCapitalization: TextCapitalization.none,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
