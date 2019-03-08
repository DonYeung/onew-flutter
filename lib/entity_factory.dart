import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/model/article_model_entity.dart';
import 'package:onewflutter/model/tree_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerMsgEntity") {
      return BannerMsgEntity.fromJson(json) as T;
    } else if (T.toString() == "ArticleModel") {
      return ArticleModel.fromJson(json) as T;
    } else if (T.toString() == "TreeEntity") {
      return TreeEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}