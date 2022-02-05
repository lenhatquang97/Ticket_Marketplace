import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import 'dart:convert' show utf8;
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:ticket_marketplace/models/wallet.dart';
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:ticket_marketplace/utils/user_storage.dart';

Wallet CreateNewWallet(String password) {
  var ec = getP256();
  var priv = ec.generatePrivateKey();
  var pub = priv.publicKey;

  return Wallet(priv.toString(), pub.toString());
}

String GetPriavteKey(String hashedPrivateKey, String password) {
  return hashedPrivateKey;
}

String EncryptPrivateKey(String privateKey, String password) {
  while (password.length < 32) {
    password = password + 'k';
  }
  final keyFernet = encrypt.Key.fromUtf8(password);
  final fernet = encrypt.Fernet(keyFernet);
  final encrypter = encrypt.Encrypter(fernet);
  final encrypted = encrypter.encrypt(privateKey);
  return base64Encode(encrypted.bytes);
}

String DecryptPrivateKey(String encodedPrivateKey, String password) {
  while (password.length < 32) {
    password = password + 'k';
  }
  final encryptedKey = encrypt.Encrypted.from64(encodedPrivateKey);
  final keyFernet = encrypt.Key.fromUtf8(password);
  final fernet = encrypt.Fernet(keyFernet);
  final encrypter = encrypt.Encrypter(fernet);
  final decrypted = encrypter.decrypt(encryptedKey);

  return decrypted.toString();
}
