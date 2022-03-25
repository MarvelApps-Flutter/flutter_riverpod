
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/common_component.dart';

final streamProvider = StreamProvider<String>((ref) => Stream.periodic(
      const Duration(milliseconds: 400),
      (count) => '$count',
    ));

class StreamProviderPageScreen extends ConsumerWidget{
  final String title;
  const StreamProviderPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamProvider);
    return Scaffold(
      appBar: CommonComponent.appbar(title),
      body: Center(
        child: stream.when(
          data: (value) => Text(value.toString(),style: const TextStyle(fontSize: 50),),
          loading: () => const CircularProgressIndicator(),
          error: (e, stack) => Text('Error: $e'),
        ), 
        ),
      );
  }
  
}