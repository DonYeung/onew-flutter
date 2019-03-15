import 'package:flutter/material.dart';
import 'package:onewflutter/model/article_list_entity.dart';
import 'package:onewflutter/pages/webview_page.dart';

class ArticleItem extends StatefulWidget {
  List<Datas> itemData = new List();


  ArticleItem(this.itemData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ArticleView(itemData);
  }

}

class ArticleView extends State<ArticleItem> {

  List<Datas> itemData = new List();

  ArticleView(articlelist);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> items = [];
    var title;
    var url;
    var author;
    var niceDate;
    if (itemData != null && itemData.length > 0) {
      for (int i = 0; i < itemData.length; i++) {
        var item = itemData[i];
        title = item.title;
        url = item.link;
        author = item.author;
        niceDate = item.niceDate;

        items.add(new GestureDetector(
          onTap: () {
            _handOnItemClick(url, title);
          },
          child: AspectRatio(aspectRatio: 2.0 / 1.0,
            child: new InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new WebViewPage(title: title,url: url);
                }));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          author,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: Text(
                            niceDate,
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF3D4E5F),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

              ),
        ));
  }
  }
    return new ListView(children: items);
  }


  void _handOnItemClick(itemData,title) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
      return new WebViewPage(url: itemData,title: title);
    }));
  }

}