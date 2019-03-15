import 'package:flutter/material.dart';

class DialogUtil extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  DialogUtil({
    Key key,
    @required this.title,
    @required this.message,
    @required this.negativeText,
    @required this.positiveText,
    @required this.onPositivePressEvent,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          padding: const EdgeInsets.fromLTRB(220, 10, 25, 10),
                          child: new Align(
                            alignment: FractionalOffset.bottomRight,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
//                                new FlatButton(
//                                  onPressed: onCloseEvent,
//                                  child: new Text(
//                                    negativeText,
//                                    style: TextStyle(fontSize: 14.0),
//                                  ),
//                                ),
//                                new FlatButton(
//                                  onPressed: onPositivePressEvent,
//                                  child: new Text(
//                                    positiveText,
//                                    style: TextStyle(fontSize: 14.0),
//                                  ),
//                                )
                                new Flexible(
                                  fit: FlexFit.tight,
                                  child: new FlatButton(
                                      onPressed: onCloseEvent,
                                      child: new Text(
                                        negativeText,
                                        style: TextStyle(fontSize: 14.0),
                                      )),
                                ),
                                new Flexible(
                                  fit: FlexFit.tight,
                                  child: FlatButton(
                                      onPressed: onPositivePressEvent,
                                      child: new Text(
                                        positiveText,
                                        style: TextStyle(fontSize: 14.0),
                                      )),
                                )
                              ],
                            ),
                          ))),

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
}
