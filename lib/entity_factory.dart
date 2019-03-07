import 'package:onewflutter/model/banner_msg_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerMsgEntity") {
      return BannerMsgEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}