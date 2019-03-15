class Constant{
  static const int STATUS_SUCCESS = 0;

  static const String SERVER_ADDRESS = WAN_ANDROID;

  static const String WAN_ANDROID = "http://www.wanandroid.com/";

  static const int TYPE_SYS_UPDATE = 1;
  static const String KEY_THEME_COLOR = 'key_theme_color';
  static const String KEY_GUIDE = 'key_guide';
  static const String KEY_SPLASH_MODEL = 'key_splash_models';


  /// 首页banner http://www.wanandroid.com/banner/json
  static const String BANNER = "banner/json";


  /// 首页文章列表 http://www.wanandroid.com/article/list/0/json
  /// 知识体系下的文章 http://www.wanandroid.com/article/list/0/json?cid=60
  static const String ARTICLE_LIST = "article/list";



  /// 最新项目tab (首页的第二个tab) http://wanandroid.com/article/listproject/0/json
  static const String ARTICLE_LISTPROJECT = "article/listproject";


  /// 项目列表数据 http://www.wanandroid.com/project/list/1/json?cid=294
  static const String PROJECT_LIST = "project/list";


  /// 体系数据 http://www.wanandroid.com/tree/json
  static const String TREE = "tree/json";


  /// 获取公众号列表 http://wanandroid.com/wxarticle/chapters/json
  static const String WXARTICLE_CHAPTERS = "wxarticle/chapters";


  /// 查看某个公众号历史数据 http://wanandroid.com/wxarticle/list/405/1/json
  /// 在某个公众号中搜索历史文章 http://wanandroid.com/wxarticle/list/405/1/json?k=Java
  static const String WXARTICLE_LIST = "wxarticle/list";



  //收藏文章列表
  static const   String COLLECT_LIST = "lg/collect/list/";
  //搜索
  static const   String ARTICLE_QUERY = "article/query/";
  //收藏,取消收藏
  static const   String COLLECT = "lg/collect/";
  static const   String UN_COLLECT_ORIGIN = "lg/uncollect_originId/";
  //我的收藏列表中取消收藏
  static const   String UN_COLLECT_LIST = "lg/uncollect/";
  //常用网站
  static const   String FRIEND = "friend/json";
  //搜索热词
  static const   String HOT = "hotkey/json";


  static const String USER_REGISTER = "user/register"; //注册

  static const String USER_LOGIN = "user/login"; //登录

  static const String USER_LOGOUT = "user/logout"; //退出



  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }

  //http://www.shiyan360.cn/index.php/api/chuangke_list 视频列表

}
class AppConfig{
  static const String appName='onews_flutter';
  static const String version= '0.1.0';
  static const bool isDebug=true;
}