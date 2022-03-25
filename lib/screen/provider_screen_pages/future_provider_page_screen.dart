import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/common_component.dart';

final futureProvider = FutureProvider<int>((ref) => fetchData());

Future<int> fetchData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 18;
}

class FutureProviderPageScreen extends ConsumerWidget {
  final String title;
  const FutureProviderPageScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(futureProvider);
    return Scaffold(
      appBar: CommonComponent.appbar(title),
      body: Center(
        child: future.when(
          data: (value) => Text(value.toString(),style: const TextStyle(fontSize: 50),),
          loading: () => const CircularProgressIndicator(),
          error: (e, stack) => Text('Error: $e'),
        ), 
        ),
      );
  }
}
