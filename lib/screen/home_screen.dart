import 'package:flutter/material.dart';
import 'package:river_pod/screen/modifier_screen.dart';
import 'package:river_pod/screen/notifier_screen.dart';
import 'package:river_pod/screen/provider_screen.dart';
import 'package:river_pod/widget/common_component.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponent.appbar('RiverPod'),
      body: Center(child: _buildPages()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox,),
            label: 'Provider',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox,),
            label: 'Notifiers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox,),
            label: 'Modifiers',
          ),
        ],
        onTap: (int selectedindex){
          setState(() {
            index = selectedindex;
          });
        }
      ),
    );
  }
  Widget _buildPages() {
    switch (index) {
      case 0:
        return const ProviderScreen();
      case 1: 
        return const NotifierScreen();
      case 2: 
        return const ModifierScreen();
      default:
        return Container();
    }
  }

}