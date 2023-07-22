import 'package:fevent/src/network/model/common/result.dart';

abstract class FavouriteRepository {
  Future<XResult<bool>> getFavouriteEvent(String eventId);
}
