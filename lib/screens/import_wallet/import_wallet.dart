import 'package:flutter/material.dart';
import 'package:ticket_marketplace/screens/home_page.dart';
import 'package:ticket_marketplace/utils/user_storage.dart';
import 'package:ticket_marketplace/utils/wallet.dart';
import 'package:ticket_marketplace/widgets/appbar.dart';
import 'package:ticket_marketplace/widgets/password_field.dart';
import 'package:ticket_marketplace/widgets/password_indicator.dart';
import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import 'dart:convert' show utf8;
import 'package:crypto/crypto.dart';

class ImportWallet extends StatefulWidget {
  ImportWallet({Key? key}) : super(key: key);

  @override
  State<ImportWallet> createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  final newPassword = TextEditingController(text: "");
  final confirmPassword = TextEditingController(text: "");
  final secretKeyField = TextEditingController(text: "");
  static final formKey = GlobalKey<FormState>();
  String tmpPwd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppbar(),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Text(
            "Enter your secret key",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  PasswordField(
                    lable: "Your Secret Key",
                    onChanged: (value) {},
                    controller: secretKeyField,
                    hide: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter your secret key";
                      } else {
                        try {
                          PrivateKey temp =
                              PrivateKey.fromHex(getP256(), value);
                        } catch (e) {
                          return "Secret key is invalid";
                        }
                      }
                      return null;
                    },
                  ),
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
                  PasswordField(
                    lable: "Confirm Password",
                    onChanged: (value) {},
                    controller: confirmPassword,
                    validator: (value) {
                      if (value != newPassword.text) {
                        return "Password's Don't Match";
                      }
                      return null;
                    },
                  ),
                ],
              )),
          Expanded(child: Container()),
          InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                PrivateKey privateKey =
                    PrivateKey.fromHex(getP256(), secretKeyField.text);
                String publicKey = privateKey.publicKey.toString();
                String password = newPassword.text;

                SecureStorage.writeSecureData(SecureStorage.privateKeyHashed,
                    EncryptPrivateKey(privateKey.toString(), password));
                SecureStorage.writeSecureData(
                    SecureStorage.publicKey, publicKey);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: const Color(0xff0049e4),
                    borderRadius: BorderRadius.circular(29)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                      child: Text(
                    "Import",
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
    );
  }
}
