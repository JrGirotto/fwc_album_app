import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/register_stickers_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupsStickers>> getMyAlbum();
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber);

  Future<StickerModel> create(RegisterStickersModel registerStickerModel);
}
