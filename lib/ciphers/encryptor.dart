
String encrypt(String input, String key) {
  List<int> inputBytes = input.codeUnits;
  List<int> keyBytes = key.codeUnits;
  List<int> encryptedBytes = [];

  for (int i = 0; i < inputBytes.length; i++) {
    encryptedBytes.add(inputBytes[i] ^ keyBytes[i % keyBytes.length]);
  }

  return encryptedBytes.map((byte) => byte.toString()).join(',');
}

String decrypt(String encrypted, String key) {
  List<int> encryptedBytes = encrypted.split(',').map(int.parse).toList();
  List<int> keyBytes = key.codeUnits;
  List<int> decryptedBytes = [];

  for (int i = 0; i < encryptedBytes.length; i++) {
    decryptedBytes.add(encryptedBytes[i] ^ keyBytes[i % keyBytes.length]);
  }

  return String.fromCharCodes(decryptedBytes);
}

  final originalText = 'Hello, World!';
  final encryptionKey = 'MySecretKey';

  final encryptedText = encrypt(originalText, encryptionKey);
  // print('Encrypted: $encryptedText');
  // print(encryptedText.runtimeType);

  final decryptedText = decrypt(encryptedText, encryptionKey);
  // print('Decrypted: $decryptedText');
  // print(decryptedText.runtimeType);

