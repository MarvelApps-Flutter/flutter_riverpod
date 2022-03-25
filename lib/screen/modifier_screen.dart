import 'package:flutter/material.dart';
import 'package:river_pod/screen/modifier_screen_pages/family_object_modifier_page_screen.dart';
import 'package:river_pod/screen/modifier_screen_pages/family_primitive_modifier_page_screen.dart';
import 'package:river_pod/widget/button_widget.dart';
import 'package:river_pod/widget/common_component.dart';

class ModifierScreen extends StatelessWidget {
  const ModifierScreen({ Key? key }) : super(key: key);

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
              text: 'Family Primitive', 
              onclick: ()=>CommonComponent.navigateTo(context,const FamilyPrimitiveModifierPageScreen(title: 'Family Primitive Modifier',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight
              ),
            ButtonWidget(
              text: 'Family Object', 
              onclick: ()=>CommonComponent.navigateTo(context,const FamilyObjectModifierPageScreen(title: 'Family Object Modifier',)),
              buttonWidth: buttonWidth,
              buttonHeight: buttonHeight,
              ),
          ],
        ),
      ),
    );
  }
}