import 'dart:typed_data';

class Pyth {
  final int price;
  final int emaConf;

  Pyth({required this.price, required this.emaConf});

  factory Pyth.fromAccountData(List<int> data) {
    return Pyth(
      price: Uint8List.fromList(data.getRange(74, 82).toList()).buffer.asByteData().getInt32(0, Endian.host),
      emaConf: Uint8List.fromList(data.getRange(118, 126).toList()).buffer.asByteData().getInt32(0, Endian.host)
    );
  }
}