import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new VideoPageState();
  }

}
class VideoPageState extends State<VideoPage> with AutomaticKeepAliveClientMixin{

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Text('视频'),
    );
  }



}