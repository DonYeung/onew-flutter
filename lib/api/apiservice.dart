
import 'package:dio/dio.dart';
import 'package:onews_flutter/dioUtil.dart';
import 'package:onews_flutter/model/banner_msg_entity.dart';


class ApiService {

  Future<List<BannerMsgData>> getBannerMsgData() async{
    var response =
        await DioUtil.getInstance().get('/banner/json');
    List<BannerMsgData> banResModellist =BannerMsgEntity.fromJson(response).data;

    print(banResModellist.length);
    return banResModellist;
  }
}