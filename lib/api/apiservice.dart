import 'package:onewflutter/common/common.dart';
import 'package:onewflutter/dioUtil.dart';
import 'package:onewflutter/model/banner_msg_entity.dart';
import 'package:onewflutter/model/tree_entity.dart';
import 'package:onewflutter/utils/logutil.dart';
import 'package:onewflutter/model/article_model_entity.dart';
import 'package:onewflutter/model/SystemTreeModel.dart';


class ApiService {

  Future<List<BannerMsgData>> getBannerMsgData() async{
    print('开始获取banner数据...............');

    var response =
        await DioUtil.getInstance().get(Constant.BANNER);
    List<BannerMsgData> banResModellist =BannerMsgEntity.fromJson(response).data.toList();

    print(banResModellist.length);
    return banResModellist.toList();
  }


  Future<List<TreeDatachild>> getTreelList() async{
    print('开始获取getTreelList数据...............');

    var response =
    await DioUtil.getInstance().get(Constant.TREE);
    List<TreeDatachild> treedatalist;

    treedatalist =  response.data.map((value){
      return TreeEntity.fromJson(value);

    });
    return treedatalist;
  }


  Future getArticleList(int _page) async {
    print('开始获取getArticleList数据...............');
    var response = await DioUtil.getInstance().get(Constant.ARTICLE_LIST,data:_page);

    List<Article> articlelist =ArticleModel.fromJson(response).data.datas.toList();

    LogUtil.v("获取getArticleList成功："+articlelist.length.toString());
    return articlelist.toList();
  }


  Future getHttp(String TypeText) async{
    var data={'name':TypeText};

    var response = await DioUtil.getInstance().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian",
    data: data);
    return response;
  }

}