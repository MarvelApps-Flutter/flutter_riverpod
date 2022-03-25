import 'package:flutter/material.dart';
import 'package:river_pod/screen/provider_screen_pages/future_provider_page_screen.dart';
import 'package:river_pod/screen/provider_screen_pages/provider_page_screen.dart';
import 'package:river_pod/screen/provider_screen_pages/state_provider_page_screen.dart';
import 'package:river_pod/screen/provider_screen_pages/stream_provider_page_screen.dart';
import 'package:river_pod/widget/button_widget.dart';
import 'package:river_pod/widget/common_component.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({ Key? key }) : super(key: key);

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
              text: 'Provider',
              onclick: ()=>CommonComponent.navigateTo(context,const ProviderPageScreen(title: 'Provider',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
            ),
            ButtonWidget(
              text: 'State Provider',
              onclick: ()=>CommonComponent.navigateTo(context,const StateProviderPageScreen(title: 'State Provider',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
            ),
            ButtonWidget(
              text: 'Future Provider',
              onclick: ()=>CommonComponent.navigateTo(context,const FutureProviderPageScreen(title: 'Future Provider',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
            ),
            ButtonWidget(
              text: 'Stream Provider',
              onclick: ()=>CommonComponent.navigateTo(context,const StreamProviderPageScreen(title: 'Stream Provider',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
            ),
          ],
        ),
      ),
    );
  }
  
}