import 'package:chat_app/widgets/calls.dart';
import 'package:chat_app/widgets/chats.dart';
import 'package:chat_app/widgets/groups.dart';
import 'package:chat_app/widgets/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List screens = const [
    chatsWidgets(),
    CallsWidgets(),
    GroupsWidgets(),
    SettingsWidgets()
  ];
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => screens[_selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Chat App')),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: ((context, index) {
            return const ListTile(
              title: Text("Tahmina Bristy"),
            );
          })),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_sharp),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Color.fromARGB(255, 189, 186, 186),
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
