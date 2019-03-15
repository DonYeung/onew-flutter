import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onewflutter/pages/splash_page.dart';
import 'package:onewflutter/utils/logutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:onewflutter/utils/DialogUtil.dart';

import 'dart:async';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool isgranted =false;


  @override
  Widget build(BuildContext context) {


//    requestPermission(context);
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ONews_Flutter',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashPage()
      );


    /**
     * 去除红屏error
     */
//    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
//      return getErrorWidget(context, errorDetails);
//    };
  }

  Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
    return Center(child: Text("Error appeared.", style: Theme
        .of(context)
        .textTheme
        .title
        .copyWith(color: Colors.white),),);
  }

  Future requestPermission(BuildContext context) async {
    PermissionGroup group = PermissionGroup.camera;
    PermissionGroup group2 = PermissionGroup.storage;
    PermissionGroup group3 = PermissionGroup.phone;
    PermissionGroup group4 = PermissionGroup.location;

    Directory appDir;

    LogUtil.v("Platform isIOS:" + Platform.isIOS.toString());

    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(group);
    permission = await PermissionHandler().checkPermissionStatus(group2);
    permission = await PermissionHandler().checkPermissionStatus(group3);
    permission = await PermissionHandler().checkPermissionStatus(group4);
//    showAlertDialog(context);
    if (permission != PermissionStatus.granted) {
      isgranted =false;
      Map<PermissionGroup,
          PermissionStatus> permissions = await PermissionHandler()
          .requestPermissions([group, group2, group3, group4]);
      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
        //若不授予权限的操作
//        Fluttertoast.showToast(
//            msg: "请授予访问存储空间的权限！",
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            fontSize: 14);

//         DialogUtil("帮助", "当前应用缺少必要的电话、存储空间、位置信息以及相机的权限。请点击设置按钮-权限，打开所需权限",
//            "取消", "设置",  null, null);

//        return showAlertDialog(context);
      } else
      if (permissions[PermissionGroup.camera] != PermissionStatus.granted) {
        Fluttertoast.showToast(
            msg: "请授予访问相机的权限！",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 14);
//        return opensetting();
      }
      else if (permissions[PermissionGroup.phone] != PermissionStatus.granted) {
        Fluttertoast.showToast(
            msg: "请授予访问电话的权限！",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 14);
//        return opensetting();
      }
      else if (permissions[PermissionGroup.location] != PermissionStatus.granted) {
        Fluttertoast.showToast(
            msg: "请授予访问位置信息的权限！",
            toastLength: Toast.LENGTH_SHORT,

            gravity: ToastGravity.BOTTOM,
            fontSize: 14);
//        return opensetting();
      }

    }else{
      isgranted =true;
    }
  }

  Future opensetting() async {
    await PermissionHandler().openAppSettings();
  }





}
