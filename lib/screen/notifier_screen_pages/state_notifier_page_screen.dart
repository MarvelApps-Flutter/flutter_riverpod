import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/car_model.dart';
import 'package:river_pod/provider/car_state_notifier.dart';
import 'package:river_pod/widget/button_widget.dart';
import 'package:river_pod/widget/common_component.dart';


final stateNotifierProvider = 
    StateNotifierProvider<CarStateNotifier,Car>((ref) => CarStateNotifier());

class StateNotifierPageScreen extends ConsumerWidget {
  final String title;
  const StateNotifierPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final car = ref.watch(stateNotifierProvider);
    final speed = car.speed;
    final doors = car.doors;

    final carNotifier = ref.watch(stateNotifierProvider.notifier);

    return Scaffold(
      appBar: CommonComponent.appbar(title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Speed: $speed',
              style: const TextStyle(
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                          ),
              ),
            const SizedBox(height: 10),
            Text(
              'Doors: $doors',
              style: const TextStyle(
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                          ),
              ),
            const SizedBox(height: 35),
            buildButtons(ref,context),
            const SizedBox(height: 35),
            const Text(
              'Slide to increase doors',
              style: TextStyle(
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                          ),
              ),
            const SizedBox(height: 15),
            Slider(
              value: car.doors.toDouble(),
              max: 4,
              onChanged: (value) => carNotifier.setDoors(value.toInt()),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtons(WidgetRef ref,BuildContext context) {
    final carNotifier = ref.watch(stateNotifierProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
          text: 'Speed +5', 
          onclick: carNotifier.increaseSpeed,
          buttonWidth: MediaQuery.of(context).size.width*0.4,
          ),
        const SizedBox(width: 12),
        ButtonWidget(
          text: 'Hit Brake -30', 
          onclick: carNotifier.hitBrake,
          buttonWidth: MediaQuery.of(context).size.width*0.4,
          ),
      ],
    );
  }
}
