import 'package:ticket_marketplace/utils/user_storage.dart';
import 'package:ticket_marketplace/utils/wallet.dart';

class Wallet {
  final String privateKey;
  final String publicKey;

  Wallet(this.privateKey, this.publicKey);

  Future<void> StoreWallet(String password) async {
  }
}
