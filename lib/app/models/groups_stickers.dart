// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class GroupsStickers {
  GroupsStickers({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  List<UserStickerModel> stickers;
  final String flag;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupsStickers.fromMap(Map<String, dynamic> map) {
    return GroupsStickers(
      id: (map['id'] ?? 0) as int,
      countryCode: (map['country_code'] ?? '') as String,
      countryName: (map['country_name'] ?? '') as String,
      stickersStart: (map['stickers_start'] ?? 0) as int,
      stickersEnd: (map['stickers_end'] ?? 0) as int,
      flag: (map['flag'] ?? '') as String,
      stickers: List<UserStickerModel>.from(
        (map['stickers'] ?? []).map<UserStickerModel>(
          (x) => UserStickerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupsStickers.fromJson(String source) =>
      GroupsStickers.fromMap(json.decode(source) as Map<String, dynamic>);
}
