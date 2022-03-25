import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/common_component.dart';

final stringProvider = Provider<String>((ref) => 'Bonjour||Privet||Hola==Hello ');

class ProviderPageScreen extends ConsumerWidget{
  final String title;
  const ProviderPageScreen({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(stringProvider);
    return Scaffold(
      appBar: CommonComponent.appbar(title),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              maxLines: null,
              style: const TextStyle(
                fontFamily: 'NotoSerif',
                fontSize: 20,
                fontWeight: FontWeight.w600
                ),
              ),
          ],
        ),
      ),
    );
  }
  
}