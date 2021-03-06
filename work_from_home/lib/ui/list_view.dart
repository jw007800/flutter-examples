/**
 * @描述 首页列表
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019-11-03
 *
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../router/application.dart';
import '../router/routers.dart';
import 'package:share/share.dart';

class HomeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewState();
  }
}

class _ListViewState extends State<HomeList> {
  List itemTitles = [
    '分享',
    'eventbus事件总线',
    '原始指针事件',   //  文件解压缩
    'Notification',//WebView（flutter_webview_plugin）
    'GestureDetector',//WebView（flutter官方插件）
    'provider状态管理',
    'shared_preferences',
    'Video',//Flutter Channel
    'url_launcher',
    '对话框',
    '海报轮播',
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          _listItem(itemTitles[0], () {
            //sqflite数据库
            Application.router.navigateTo(context, Routes.sqflitePage,
                transition: TransitionType.fadeIn);
//            Share.share(
//                '【百度一下】\nhttps://baidu.com');

          }),
          _listItem(itemTitles[1], () {
            //eventbus事件总线
            Application.router.navigateTo(context, Routes.eventBusPage,
                transition: TransitionType.inFromRight);
          }),
          _listItem(itemTitles[2], () {
            //文件解压缩
            //自定义页面路由动画
            var transition = (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return ScaleTransition(
                //缩放
                scale: animation,
                child: RotationTransition(
                  //旋转
                  turns: animation,
                  child: child,
                ),
              );
            };
//         Application.router.navigateTo(
//           context,
//           Routes.fileZipPage,
//           transition: TransitionType.custom,
//           transitionBuilder: transition,
////           transitionDuration: Duration(milliseconds: 1000),
//         );
            Application.router.navigateTo(
              context,
              Routes.fileZipPage,
              transition: TransitionType.inFromLeft,
            );
          }),
          _listItem(itemTitles[3], () {
            //WebView（flutter_webview_plugin）

            Application.router.navigateTo(
              context,
              '${Routes.webViewPlginPage}?url=${Uri.encodeComponent("https://github.com/ChessLuo")}&title=flutter_webview_plugin',
              transition: TransitionType.native,
            );
          }),
          _listItem(itemTitles[4], () {
            //WebView（flutter官方插件）
            Application.router.navigateTo(context,
                '${Routes.flutterWebViewPage}?url=${Uri.encodeComponent("https://github.com/ChessLuo")}&title=flutter_webview',
                transition: TransitionType.material);
          }),
          _listItem(itemTitles[5], () {
            //provider状态管理
            Application.router.navigateTo(context, Routes.providerPage,
                transition: TransitionType.cupertino);
          }),
          _listItem(itemTitles[6], () {
            //shared_preferences数据持久化
            Application.router.navigateTo(context, Routes.sharedPreferences,
                transition: TransitionType.inFromLeft);
          }),
          _listItem(itemTitles[7], () {
            //Flutter Channel
            Application.router.navigateTo(context, Routes.flutterChannel,
                transition: TransitionType.inFromRight);
          }),
          _listItem(itemTitles[8], () {
            //Flutter Channel
            Application.router.navigateTo(context, Routes.urlLauncher,
                transition: TransitionType.cupertino);
          }),
          _listItem(itemTitles[9], () {
            //Diaolog
            Application.router.navigateTo(context, Routes.dialogShow,
                transition: TransitionType.cupertino);
          }),
          _listItem(itemTitles[10], () {
            //Flutter Channel
            Application.router.navigateTo(context, Routes.bannerPage,
                transition: TransitionType.cupertino);
          }),
        ],
      ),
    );
  }

  ///demo Item入口View
  Widget _listItem(String itemTitle, Function onTap) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(bottom: BorderSide(color: Colors.grey))),
      child: ListTile(
        title: Text(itemTitle),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}



