import 'package:flutter/material.dart';
import 'package:river_pod/screen/notifier_screen_pages/change_notifier_page_screen.dart';
import 'package:river_pod/screen/notifier_screen_pages/state_notifier_page_screen.dart';
import 'package:river_pod/widget/button_widget.dart';
import 'package:river_pod/widget/common_component.dart';

class NotifierScreen extends StatelessWidget {
  const NotifierScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width*0.8;
    double buttonHeight = 60;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonWidget(
              text: 'StateNotifier Provider',
              onclick: ()=>CommonComponent.navigateTo(context,const StateNotifierPageScreen(title: 'StateNotifier Provider',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
              ),
            ButtonWidget(
              text: 'ChangeNotifier Provider', 
              onclick: ()=>CommonComponent.navigateTo(context,const ChangeNotifierPageScreen(title: 'ChangeNotifier Provider')),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
              ),
          ],
        ),
      ),
    );
  }
  
}