// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:template/template.dart';

class VActionTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final bool obscureText;

  factory VActionTextFormField.email(
          {TextEditingController? controller,
          ValueChanged<String>? onChange,
          FormFieldValidator<String>? validator}) =>
      VActionTextFormField(
        labelText: "Email",
        hintText: "test@gmail.com",
        onChange: onChange,
        validator: validator,
        prefixIcon: const Icon(Icons.email),
        controller: controller,
      );

  static password(
          {TextEditingController? controller,
          ValueChanged<String>? onChange,
          FormFieldValidator<String>? validator,
          String labelText = "Password"}) =>
      VActionPasswordField(
        controller: controller,
        onChange: onChange,
        validator: validator,
        labelText: labelText,
      );

  const VActionTextFormField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChange,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
      ),
    );
  }
}

class VActionPasswordField extends HookWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validator;
  final String? labelText;
  const VActionPasswordField({
    Key? key,
    this.controller,
    this.onChange,
    this.validator,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSecure = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 3000),
    );

    return VActionTextFormField(
      labelText: labelText,
      onChange: onChange,
      validator: validator,
      obscureText: isSecure.value,
      prefixIcon: const Icon(Icons.lock),
      controller: controller,
      suffixIcon: InkWell(
        onTap: () {
          if (isSecure.value) {
            animationController.forward(); // Play the animation forward.
          } else {
            animationController.reverse(); // Play the animation in reverse.
          }
          isSecure.value = !isSecure.value;
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isSecure.value
              ? const Icon(
                  Icons.remove_red_eye_outlined,
                  key: Key("IsSecure"),
                )
              : const Icon(
                  Icons.remove_red_eye,
                  key: Key("IsNotSecure"),
                ),
        ),
      ),
    );
  }
}
