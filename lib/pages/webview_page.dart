import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:onewflutter/utils/logutil.dart';

/**
 *
 * 加载网页
 */
class WebViewPage extends StatefulWidget {
  String url;
  String title;

  WebViewPage({Key key, this.url, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WebViewPageState();
  }
}

class WebViewPageState extends State<WebViewPage> {
  bool isload = false;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    flutterWebviewPlugin.onStateChanged.listen((state) {
      LogUtil.v("state_:" + state.type.toString());
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isload = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isload = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text(widget.title),
        bottom: new PreferredSize(
            child: isload
                ? new LinearProgressIndicator()
                : new Divider(
                    height: 1.0,
                    color: Theme.of(context).primaryColor,
                  ),
            preferredSize: const Size.fromHeight(1.0)),
      ),
      url: widget.url,
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
    );
  }
}
