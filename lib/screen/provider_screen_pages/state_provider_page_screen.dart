import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/common_component.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderPageScreen extends ConsumerWidget {
  final String title;
  const StateProviderPageScreen({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider.state);
    return Scaffold(
      appBar: CommonComponent.appbar(title),
      body: Center(
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              ),
              onPressed: () => count.state++,
              child: const Icon(Icons.add),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                count.state.toString(),
                style: const TextStyle(fontSize: 50),
                ),
              
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
              ),
              onPressed: () => count.state--,
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}