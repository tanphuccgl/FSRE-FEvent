import 'package:fevent/src/network/model/common/result.dart';
import 'package:fevent/src/network/model/favourite.dart';
import 'package:fevent/src/network/model/post_favourite.dart';

abstract class FavouriteRepository {
  Future<XResult<FavouriteModel>> getFavouriteEvent(String eventId);
  Future<XResult<PostFavouriteModel>> postFavouriteEvent(
      String eventId, String token);

  Future<XResult<bool>> removeFavouriteEvent(String eventId, String token);
}
