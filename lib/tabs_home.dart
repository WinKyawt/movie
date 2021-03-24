import 'package:flutter/material.dart';

class Bookkeeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
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
            title: Text("Title text"),
            bottom: menu(),
          ),
          body: TabBarView(
            children: [
              Container(child: Icon(Icons.directions_car)),
              Container(child: Icon(Icons.directions_transit)),
              Container(child: Icon(Icons.directions_bike)),
              Container(child: Icon(Icons.directions_bike)),
            ],
          ),
          bottomNavigationBar: menu2(),
        ),
      ),
    );
  }

  Widget menu2() {
    return Container(
      color: Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Transactions",
            icon: Icon(Icons.euro_symbol),
          ),
          Tab(
            text: "Bills",
            icon: Icon(Icons.assignment),
          ),
          Tab(
            text: "Balance",
            icon: Icon(Icons.account_balance_wallet),
          ),
          Tab(
            text: "Options",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  Widget menu() {
    return TabBar(
      tabs: [
        Tab(
          text: "Transactions",
          icon: Icon(Icons.euro_symbol),
        ),
        Tab(
          text: "Bills",
          icon: Icon(Icons.assignment),
        ),
        Tab(
          text: "Balance",
          icon: Icon(Icons.account_balance_wallet),
        ),
        Tab(
          text: "Options",
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
