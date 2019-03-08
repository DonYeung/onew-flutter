import 'package:dio/dio.dart';
import 'package:onewflutter/config/httpHeaders.dart';

class DioUtil {
  static DioUtil _instance; //豆瓣
  static DioUtil _jhInstance; //聚合数据
  static DioUtil _afdInstance;

  Dio dio;
  CancelToken cancelToken;

  //是否是是debug模式
  static bool _isDebug = false;

  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = DioUtil();
    }
    return _instance;
  }

  DioUtil() {
    var baseUrl;
    baseUrl = 'http://www.wanandroid.com/';
    BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
//      headers: httpHeaders,
    );
    dio = new Dio(options);
    cancelToken = CancelToken();
  }

  get(url, {data}) async {
    Response response;
    try {
      if (data != null) {
        response =
            await dio.get(url, queryParameters: data, cancelToken: cancelToken);
      } else {
        response = await dio.get(url, cancelToken: cancelToken);
      }
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消' + e.message);
      } else {
        print('get请求发生错误:' + e.toString());
      }
    }
//    print('get请求headers:::'+response.headers.toString());
    return response.data;
  }

  post(url, data) async {
    Response response;
    try {
      response = await dio.post(url, data: data, cancelToken: cancelToken);
      print('post请求成功！response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消:' + e.message);
      } else {
        print('post请求发生错误：' + e.toString());
      }
    }
    return response.data;
  }

  download(urlPath, savePath) {
    Response response;
    try {
      dio.download(urlPath, savePath);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('download请求取消:' + e.message);
      } else {
        print('download请求发生错误：' + e.toString());
      }
    }
  }

  cancel() {
    cancelToken.cancel('cancel');
  }

  void _printDataStr(String tag, Object value) {
    String da = value.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("[$tag]:" + da.substring(0, 512));
        da.substring(512, da.length);
      } else {
        print("[$tag]:  " + da);
        da = "";
      }
    }
  }


  /// print Http Log.
  void _printHttpLog(Response response) {
    if (!_isDebug) {
      return;
    }
    try {
      print("----------------Http Log----------------" +
          "\n[statusCode]:   " +
          response.statusCode.toString() +
          "\n[request   ]:   ");
      _printDataStr("reqdata ", response.request.data);
      _printDataStr("response", response.data);
    } catch (ex) {
      print("Http Log" + " error......");
    }
  }

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }



}
