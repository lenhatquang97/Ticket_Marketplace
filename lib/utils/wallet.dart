import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import 'dart:convert' show utf8;
import 'package:crypto/crypto.dart';
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

encrypt.Encrypted EncryptPrivateKey(String privateKey, String password) {
  while (password.length < 32) {
    password = password + 'k';
  }
  final keyFernet = encrypt.Key.fromUtf8(password);
  final fernet = encrypt.Fernet(keyFernet);
  final encrypter = encrypt.Encrypter(fernet);
  final encrypted = encrypter.encrypt(privateKey);
  print(encrypted.bytes.toString());
  return encrypted;
}

String DecryptPrivateKey(hashedPrivateKey, String password) {
  while (password.length < 32) {
    password = password + 'k';
  }
  final keyFernet = encrypt.Key.fromUtf8(password);
  final fernet = encrypt.Fernet(keyFernet);
  final encrypter = encrypt.Encrypter(fernet);
  final decrypted = encrypter.decrypt(hashedPrivateKey);

  return decrypted.toString();
}

Future<Signature> SignMsg(String msg) async {
  var msgEncoded = utf8.encode(msg);
  var msgHash = sha256.convert(msgEncoded).toString();

  // convert to buffer
  var hash = List<int>.generate(msgHash.length ~/ 2,
      (i) => int.parse(msgHash.substring(i * 2, i * 2 + 2), radix: 16));

  // sign
  final priv = await SecureStorage.readSecureData('privateKey');
  var ec = getP256();
  var sig = signature(PrivateKey.fromBytes(ec, base64.decode(priv)), hash);
  return sig;
}
