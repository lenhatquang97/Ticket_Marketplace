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

Future<Signature> SignMsg(String msg, String password) async {
  var msgEncoded = utf8.encode(msg);
  var msgHash = sha256.convert(msgEncoded).toString();

  // convert to buffer
  var hash = List<int>.generate(msgHash.length ~/ 2,
      (i) => int.parse(msgHash.substring(i * 2, i * 2 + 2), radix: 16));

  // sign
  final privHashed =
      await SecureStorage.readSecureData(SecureStorage.privateKeyHashed);
  final priv = DecryptPrivateKey(privHashed, password);
  var sign = signature(PrivateKey.fromHex(getP256(), priv), hash);
  return sign;
}
