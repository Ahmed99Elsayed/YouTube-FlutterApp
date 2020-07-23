import 'package:flutter/material.dart';

// import './home_page.dart';

void main() => runApp(YouTubeApp());

class YouTubeApp extends StatefulWidget {
  @override
  _YouTubeAppState createState() => _YouTubeAppState();
}

class _YouTubeAppState extends State<YouTubeApp> {
  @override
  void initState() {
    print('Home ');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          backgroundColor: Colors.grey[900],
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white70))),
      debugShowCheckedModeBanner: false,
      home: HomePage2(),
    );
  }
}

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with TickerProviderStateMixin {
  List<String> _tabs = [
    'All',
    'Movies',
    'Series',
    'Musics',
    'Learning',
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  Widget build(BuildContext context) {
    print('build ');
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Theme.of(context).backgroundColor,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.home),
              Icon(Icons.email),
              Icon(Icons.subscriptions),
              Icon(Icons.explore),
              Icon(Icons.video_library),
            ],
          ),
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return [
              SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  // forceElevated: innerBoxIsScrolled,
                  title: Text('YouTube'),
                  backgroundColor: Theme.of(context).backgroundColor,
                  bottom: PreferredSize(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            tabs: _tabs
                                .map((String name) => Container(
                                      height: 30,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Tab(
                                            child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            name.toString(),
                                          ),
                                        )),
                                      ),
                                    ))
                                .toList(),
                            indicator: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      preferredSize: Size.fromHeight(50))),
            ];
          },
          body: Container(
            color: Theme.of(context).backgroundColor,
            child: TabBarView(
                controller: _tabController,
                children: _tabs.map((String name) {
                  return Builder(builder: (BuildContext context) {
                    return CustomScrollView(
                      slivers: [
                        SliverFixedExtentList(
                          itemExtent: 300.0,
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      VideoDetalis(
                                          listname: name, index: index),
                                      Container(
                                        height: 80,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.cyan,
                                            ),
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Wael Ghonien: Fuck myself and my country',
                                                  ),
                                                  Text('Wael Ghonien')
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            childCount: 10,
                          ),
                        ),
                      ],
                    );
                  });
                }).toList()),
          )),
    );
  }
}

class VideoDetalis extends StatelessWidget {
  final String listname;
  final int index;
  VideoDetalis({this.listname, this.index});
  @override
  Widget build(BuildContext context) {
    print('video de');
    return Container(
      height: 200,
      width: 400,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MianVideo())),
        child: Image.asset(
          'images/ghonem.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MianVideo extends StatefulWidget {
  @override
  _MianVideoState createState() => _MianVideoState();
}

class _MianVideoState extends State<MianVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onVerticalDragEnd: (c) {
                  print(c.velocity.pixelsPerSecond);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Image.asset(
                    'images/ghonem.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  color: Colors.blue,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    child: ListView(
                      children: [
                        Container(
                          height: 50,
                          color: Colors.greenAccent,
                        ),
                        Divider(),
                        Container(height: 100, color: Colors.redAccent),
                        Container(height: 50, color: Colors.cyan),
                        Divider(),
                        Container(
                          // height: 100,
                          color: Colors.grey,
                          child: Row(
                            children: [
                              CircleAvatar(
                                  radius: 30, backgroundColor: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('tille'),
                                    Text('username'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(height: 50, color: Colors.indigo),
                        Divider(),
                        Container(height: 200, color: Colors.lime),
                        Divider(),
                        Container(
                          height: 300,
                          color: Colors.pink,
                          child: ListView(
                            children: List.generate(
                                10,
                                (index) => Padding(
                                    padding: EdgeInsets.all(0.6),
                                    child: Container(
                                      width: 200,
                                      color: Colors.black,
                                    ))),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        ...List.generate(
                            10,
                            (index) => Padding(
                                padding: EdgeInsets.all(0.6),
                                child: Container(
                                  height: 200,
                                  color: Colors.black,
                                ))).toList(),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

///[new video tab for whole video ]
