import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noraynapp/Service/ImageStream.dart';
import 'package:noraynapp/Widgets/NavigationBar.dart';
import 'package:noraynapp/Widgets/NewsCard.dart';
import 'package:noraynapp/Widgets/SliderView.dart';
import 'package:provider/provider.dart';
import 'package:noraynapp/Service/NewsStream.dart';
import 'package:noraynapp/Widgets/Subscribe.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> view = [];
    var newsview = Provider.of<List<News>>(context);
    var images = Provider.of<List<ImagesStream>>(context);
    try{
    view.add(
      Text(
        'الأخبار',
        style: TextStyle(fontSize: 30, color: Colors.black87),
      ),
    );
      view.add(
        SliderView(),
      );
      for (int i = 0; i < newsview.length; i++) {
        view.add(NewsCard(
          content: newsview[i].title ?? '',
        ));
      }
    view.add(
      Text(
        'ليصلك جديداً',
        style: TextStyle(
          fontSize: 30,
          color: Colors.black87,
        ),
      ),
    );}catch(e){
      Container(
        child: CircularProgressIndicator(),
      );
    }
    view.add(Subscribe());
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          title: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'images/home.png',
                fit: BoxFit.contain,
              ),
            ),
          )),
      backgroundColor: Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: view.length,
                itemBuilder: (context, index) {
                  return view[index];
                },
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Align(
              child: NavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
