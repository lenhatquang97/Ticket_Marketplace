import 'package:flutter/material.dart';
import 'package:ticket_marketplace/screens/new_wallet/show_secretkey.dart';
import 'package:ticket_marketplace/utils/wallet.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:ticket_marketplace/widgets/password_indicator.dart';

class NewWallet extends StatefulWidget {
  const NewWallet({Key? key}) : super(key: key);

  @override
  State<NewWallet> createState() => _NewWalletState();
}

class _NewWalletState extends State<NewWallet> {
  final newPassword = TextEditingController(text: "");
  final confirmPassword = TextEditingController(text: "");
  static final formKey = GlobalKey<FormState>();
  String tmpPwd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              "Create Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 80,
                  child: const Center(
                      child: Text(
                    "Your password is only unlocked in your device\ncontaining your TaiBaWallet.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ))),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  PasswordField(
                    onChanged: (val) {
                      setState(() {
                        tmpPwd = val;
                      });
                    },
                    controller: newPassword,
                    lable: "New password (min 8 chars)",
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return "Password not long enough";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text("Strength:"),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(child: PasswordIndicator(pwd: tmpPwd))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PasswordField(
                    onChanged: (val) {},
                    controller: confirmPassword,
                    lable: "Confirm password",
                    validator: (value) {
                      if (value != newPassword.text) {
                        return "Password's Don't Match";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShowSecretKey(password: newPassword.text)));
                }
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: const Color(0xff2964e3),
                      borderRadius: BorderRadius.circular(29)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Center(
                        child: Text(
                      "Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                  )),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

typedef StringVoidCallback = Function(String);

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key,
      required this.lable,
      this.controller,
      this.validator,
      required this.onChanged})
      : super(key: key);

  final String lable;
  final controller;
  final validator;
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
            obscureText: true,
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
