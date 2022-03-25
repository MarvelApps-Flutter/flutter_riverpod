import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:river_pod/model/user_model.dart';
import 'package:river_pod/widget/common_component.dart';
import 'package:river_pod/widget/user_widget.dart';

Future<User> fetchUser(String username) async {
  await Future.delayed(const Duration(milliseconds: 400));

  return UserData().users.firstWhere((user) => user.name == username);
}

final userProvider = FutureProvider.family<User, String>(
    (ref, username) async => fetchUser(username));

class FamilyPrimitiveModifierPageScreen extends StatefulWidget {
  final String title;
  const FamilyPrimitiveModifierPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  _FamilyPrimitiveModifierPageScreenState createState() =>
      _FamilyPrimitiveModifierPageScreenState();
}

class _FamilyPrimitiveModifierPageScreenState
    extends State<FamilyPrimitiveModifierPageScreen> {
  String username = UserData().users.first.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonComponent.appbar(widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: Consumer(builder: (context, watch, child) {
                final future = watch.watch(userProvider(username));

                return future.when(
                  data: (user) => UserWidget(user: user),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, stack) => const Center(child: Text('Not found')),
                );
              }),
            ),
            const SizedBox(height: 32),
            _buildSearch(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search',
              style: TextStyle(fontFamily: 'NotoSerif' ,fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildUsernameDropdown(),
          ],
        ),
      );

  Widget _buildUsernameDropdown() => Row(
        children: [
          const Text(
            'Username',
            style: TextStyle(fontFamily: 'NotoSerif' ,fontSize: 24),
          ),
          const Spacer(),
          DropdownButton<String>(
            value: username,
            iconSize: 32,
            style: const TextStyle(fontFamily: 'NotoSerif' ,fontSize: 24, color: Colors.black),
            onChanged: (value) => setState(() => username = value!),
            items: UserData().users
                .map((user) => user.name)
                .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                .toList(),
          ),
        ],
      );
}




