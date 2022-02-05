import 'package:flutter/material.dart';

typedef StringVoidCallback = Function(String);

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key,
      required this.lable,
      this.controller,
      this.validator,
      this.hide,
      required this.onChanged})
      : super(key: key);

  final String lable;
  final controller;
  final validator;
  final hide;
  final StringVoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(lable),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            controller: controller,
            validator: validator,
            onChanged: onChanged,
            obscureText: (hide == false)?false:true,
            obscuringCharacter: "*",
            style: const TextStyle(color: Colors.black, fontSize: 16),
            decoration: InputDecoration(
                errorStyle: const TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.white,
                filled: true),
          ),
        )
      ],
    );
  }
}
