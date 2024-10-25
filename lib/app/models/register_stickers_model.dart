import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterStickersModel {
  final String name;
  final String stickerCode;
  final String stickerNumber;
  RegisterStickersModel({
    required this.name,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickersModel.fromMap(Map<String, dynamic> map) {
    return RegisterStickersModel(
      name: (map['name'] ?? '') as String,
      stickerCode: (map['sticker_code'] ?? '') as String,
      stickerNumber: (map['sticker_number'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStickersModel.fromJson(String source) =>
      RegisterStickersModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
