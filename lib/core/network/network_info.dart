import 'dart:io';

class NetworkInfo {

  Future<bool> get isConnected async {
   final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  }
}