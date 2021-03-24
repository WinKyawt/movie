import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmvideo/gird_home.dart';
import 'package:mmvideo/home_screen.dart';
import 'package:mmvideo/pages/fab_bottom_appbar.dart';

class TabbedHomePage extends StatefulWidget {
  TabbedHomePage({Key key}) : super(key: key);

  @override
  _TabbedHomePageState createState() => _TabbedHomePageState();
}

class _TabbedHomePageState extends State<TabbedHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> mList = [
    Center(child: HomeGridPage()),
    Center(child: HomeScreen()),
    Center(child: HomeScreen()),
    Center(child: HomeScreen()),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: mList.length, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF86221A),
                  const Color(0xFF1F1B18),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 70,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: mList,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: FABBottomAppBar(
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'All'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Me'), 
        ],
        notchedShape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
        selectedColor: Colors.red,
       ),
    );
  }

   
}
