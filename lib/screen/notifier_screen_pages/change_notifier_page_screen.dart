import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/provider/car_change_notifier.dart';
import 'package:river_pod/widget/button_widget.dart';
import 'package:river_pod/widget/common_component.dart';

final carProvider = ChangeNotifierProvider<CarChangeNotifier>((ref) => CarChangeNotifier());

class ChangeNotifierPageScreen extends ConsumerWidget {
  final String title;
  const ChangeNotifierPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref ){
    final car = ref.watch(carProvider);

    return Scaffold(
      appBar: CommonComponent.appbar(title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            'Speed: ${car.speed}',
             style:const TextStyle(
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                          ),),
            const SizedBox(height: 8),
            buildButtons(context, car,ref),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context, CarChangeNotifier car,WidgetRef ref) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonWidget(
          text: 'Speed +5', 
          onclick: ref.read(carProvider).increase,
          buttonWidth: MediaQuery.of(context).size.width*0.4,
          ),
         
          const SizedBox(width: 12),
          ButtonWidget(
          text: 'Hit Brake -30', 
          onclick: ref.read(carProvider).hitBreak,
          buttonWidth: MediaQuery.of(context).size.width*0.4,
          ),
         
        ],
      );
}
