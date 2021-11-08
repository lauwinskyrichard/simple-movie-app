import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String username;
  Home({this.username});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static final List<String> imgfile = [
    "assets/movie/alladin.jpg",
    "assets/movie/angelhasfallen.jpeg",
    "assets/movie/avenger.jpg",
    "assets/movie/c_marvel.jpg",
    "assets/movie/doraemon.jpeg",
    "assets/movie/friend_zone.jpg",
    "assets/movie/mib.jpeg",
    "assets/movie/parasite.jpeg",
    "assets/movie/spiderman.jpeg",
  ];

  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BJ Movies')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red[400]),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      child:
                          Icon(Icons.person, size: 60.0, color: Colors.black54),
                      backgroundColor: Colors.white,
                      radius: 40.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100.0, 55.0, 20.0, 0.0),
                    child: Text(
                      'Welcome, ' + widget.username,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
            //Home
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              leading: Icon(
                Icons.home,
                size: 30.0,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () => {
                Navigator.pop(context),
              },
            ),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Colors.grey[300]),
            ),
            //About Us
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              leading: Icon(
                Icons.info,
                size: 30.0,
              ),
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.of(context).pushNamed('/AboutUs'),
              },
            ),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Colors.grey[300]),
            ),
            //SignOut
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              leading: Icon(
                Icons.logout,
                size: 30.0,
              ),
              title: Text(
                'Sign Out',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () => {Navigator.of(context).pushReplacementNamed('/')},
            ),
            Container(
              height: 2.0,
              decoration: BoxDecoration(color: Colors.grey[300]),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //Image Carousel
          Container(
            margin: EdgeInsets.all(20.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: CarouselSlider(
                  items: imgfile
                      .map((item) => Container(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Image.asset(item, fit: BoxFit.cover),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                  )),
            ),
          ),
          //Tab Layout
          Container(
            height: 80.0,
            margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: TabBar(
                indicatorColor: Colors.red[400],
                indicatorWeight: 4.0,
                labelColor: Colors.red[400],
                unselectedLabelColor: Colors.grey[400],
                controller: tabController,
                tabs: [
                  Tab(
                      child: Text('New Movies',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0))),
                  Tab(
                      child: Text('Most Popular',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0))),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: TabBarView(
                controller: tabController,
                children: [
                  movieGrid(),
                  movieGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class movieGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 20.0),
          sliver: SliverGrid.count(
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: [
              InkWell(
                child: Container(
                  height: 500.0,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 120.0,
                          child: Center(
                              child: Image.asset('assets/movie/alladin.jpg',
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          alignment: Alignment.center,
                          child: Text(
                            'Aladdin',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                          alignment: Alignment.center,
                          child: Text(
                            'Fantasy',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("/MDetail");
                },
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120.0,
                        child: Center(
                            child: Image.asset('assets/movie/avenger.jpg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Avengers: Endgame',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120.0,
                        child: Center(
                            child: Image.asset('assets/movie/c_marvel.jpg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Captain Marvel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 80.0,
                        child: Center(
                            child: Image.asset('assets/movie/spiderman.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Spiderman: Far Fr...',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 68.0,
                        child: Center(
                            child: Image.asset(
                                'assets/movie/angelhasfallen.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Angel Has Fallen',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 65.0,
                        child: Center(
                            child: Image.asset('assets/movie/doraemon.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Doraemon',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Fantasy',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 68.0,
                        child: Center(
                            child: Image.asset('assets/movie/friend_zone.jpg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Friend Zone',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Comedy',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 68.0,
                        child: Center(
                            child: Image.asset('assets/movie/mib.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Men In Black',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500.0,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: 68.0,
                        child: Center(
                            child: Image.asset('assets/movie/parasite.jpeg',
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Parasite',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 2.0, 0, 0),
                        alignment: Alignment.center,
                        child: Text(
                          'Thriller',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
