import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingDialog extends Dialog {
  String title;
  String message;
  BuildContext _context;
  Function cancelListener;
  Function oklListener;

  String negativeText;
  String positiveText;

//  LoadingDialog(
//      {Key key,
//      @required String title,
//      @required String message,
//      @required String negativeText,
//      @required String positiveText,
//      @required cancelListener(BuildContext context),
//      @required oklListener(BuildContext context)})
//      : super(key: key) {
//    _title = title;
//    _message = message;
//    _negativeText = negativeText;
//    _positiveText = positiveText;
//    _cancelListener = cancelListener;
//    _oklListener = oklListener;
//  }

  LoadingDialog({
    Key key,
    @required this.title,
    @required this.message,
    @required this.negativeText,
    @required this.positiveText,
    @required this.oklListener,
    @required this.cancelListener,
  }) : super(key: key);

  /// ∑ message:          对话框内容（必需）
  /// cancelListener:   返回键取消对话框的监听回调，为null则返回键关闭对话框
  ///

  /// 取消该对话框
  void dismiss() {
    if (_context != null) {
      Navigator.pop(_context);
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;

    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)))),
//              margin: const EdgeInsets.all(12.0), //白色框

              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //对齐方式：平均间隔
                children: <Widget>[
//                  new Padding(
//                    padding: const EdgeInsets.all(20.0),
//                    child: new Stack(
//                      children: <Widget>[
                  new Container(
                    child: new Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: new Align(
                          alignment: Alignment.topLeft,
                          child: new Text(
                            title,
                            style: new TextStyle(fontSize: 19.0),
                            textAlign: TextAlign.left,
                          ),
                        )),
                  ),

                  new Container(
                    constraints: BoxConstraints(minHeight: 50.0),
                    child: new Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 25, 5),
                      child: new IntrinsicHeight(
                        child: new Text(
                          message,
                          style: TextStyle(fontSize: 16.0),
                          maxLines: 3,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),

                  new Container(
                      child: new Padding(
                          padding: const EdgeInsets.fromLTRB(200, 10, 25, 10),
//                          child: new Align(
//                            alignment: Alignment.bottomRight,
                            child: new Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text(
                                  negativeText,
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                new Text(
                                  positiveText,
                                  style: TextStyle(fontSize: 14.0),
                                )
                              ],
                            ),
//                          )
                      )
                  ),
                  this._buildBottomButtonGroup(),

//                      ],
//                    ),
//                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty)
      widgets.add(_buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty)
      widgets.add(_buildBottomPositiveButton());
    return new Flex(direction: Axis.horizontal, children: widgets);
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
          onPressed: cancelListener,
          child: new Text(
            negativeText,
            style: TextStyle(fontSize: 16.0),
          )),
    );
  }

  Widget _buildBottomPositiveButton() {
    return Flexible(
      fit: FlexFit.tight,
      child: FlatButton(
          onPressed: this.oklListener,
          child: new Text(
            positiveText,
            style: TextStyle(fontSize: 16.0),
          )),
    );
  }
}
