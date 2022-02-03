import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import 'dart:convert' show utf8;
import 'package:crypto/crypto.dart';
import 'package:ticket_marketplace/models/wallet.dart';

Wallet CreateNewWallet(String password) {
  var ec = getP256();
  var priv = ec.generatePrivateKey();
  var pub = priv.publicKey;

  return Wallet(priv.toString(), pub.toString());
}

String GetPriavteKey(String hashedPrivateKey, String password) {
  return hashedPrivateKey;
}
