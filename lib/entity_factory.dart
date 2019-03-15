import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/model/listproject_entity.dart';
import 'package:onewflutter/model/tree_entity.dart';
import 'package:onewflutter/model/article_list_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerMsgEntity") {
      return BannerMsgEntity.fromJson(json) as T;
    } else if (T.toString() == "ListprojectEntity") {
      return ListprojectEntity.fromJson(json) as T;
    } else if (T.toString() == "Tree") {
      return Tree.fromJson(json) as T;
    } else if (T.toString() == "ArticleList") {
      return ArticleList.fromJson(json) as T;
    }  else {
      return null;
    }
  }
}