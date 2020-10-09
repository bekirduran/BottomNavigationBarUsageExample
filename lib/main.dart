import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[300],
      ),
      home: MainScreenBottomNavigationBar(),
    );
  }
}


class MainScreenBottomNavigationBar extends StatefulWidget {
  @override
  _MainScreenBottomNavigationBarState createState() =>
      _MainScreenBottomNavigationBarState();
}

class _MainScreenBottomNavigationBarState
    extends State<MainScreenBottomNavigationBar> {
  String selectionScreen = "Hello World!";
  int selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomNavigationBar Usage Example"),),
      body: buildBodySection(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBodySection() {
    return Center(child: Text(selectionScreen,style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),);
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: myNavigationBarItems(),
      currentIndex: selectedItem==null?2:selectedItem,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          selectedItem = index;
          goToPage(index);
        });
      },
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(size: 40,color: Colors.blueAccent),
    );
  }

  List<BottomNavigationBarItem> myNavigationBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "Share"),
      BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Messages"),
      BottomNavigationBarItem(icon: Icon(Icons.table_chart_rounded), label: "My Shared")
    ];
  }

  void goToPage(int index) {
    switch (index){
      case 0: selectionScreen = "Home\nScreen"; break;
      case 1: selectionScreen = "Notifications\nScreen"; break;
      case 2: selectionScreen = "Share\nScreen"; break;
      case 3: selectionScreen = "Messages\nScreen"; break;
      case 4: selectionScreen = "My Shared\nScreen"; break;
    }
  }
}



