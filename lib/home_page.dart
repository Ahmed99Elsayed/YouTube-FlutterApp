import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print('home ');
    super.initState();
  }

  final _scrollCon = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollCon,
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return [
            SliverAppBar(
              pinned: true,
              forceElevated: innerBoxIsScrolled,
              floating: true,
              title: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 20,
                      width: 20,
                    ),
                    Container(
                      color: Colors.black12,
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Videos(),
      ),
    );
  }
}

class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VideosShow(),
          Container(
            color: Colors.black45,
            height: 50,
          )
        ],
      )),
    );
  }
}

class VideosShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('done ');
    return Container(
        width: double.infinity,
        height: 500,
        child: ListView(
            children: List.generate(
          20,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            );
          },
        )));
  }
}

class SecondBar extends StatelessWidget {
  SecondBar() {
    print('second bar');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(15, (index) {
          return Container(
            alignment: Alignment.center,
            child: Text('text$index   '),
          );
        }),
      ),
      height: 50,
      color: Colors.green,
    );
  }
}
