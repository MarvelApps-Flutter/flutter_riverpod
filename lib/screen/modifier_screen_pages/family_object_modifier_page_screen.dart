import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/user_model.dart';
import 'package:river_pod/model/user_request_model.dart';
import 'package:river_pod/widget/common_component.dart';
import 'package:river_pod/widget/user_widget.dart';



Future<User> fetchUser(UserRequest request) async {
  await Future.delayed(const Duration(milliseconds: 400));
  final gender = request.isFemale ? 'female' : 'male';

  return UserData().users.firstWhere(
      (user) => user.gender == gender && user.age >= request.minAge);
}

final userProvider = FutureProvider.family<User, UserRequest>(
    (ref, userRequest) async => fetchUser(userRequest));

class FamilyObjectModifierPageScreen extends StatefulWidget {
  final String title;
  const FamilyObjectModifierPageScreen({Key? key, required this.title}) : super(key: key);

  @override
  _FamilyObjectModifierPageScreenState createState() =>
      _FamilyObjectModifierPageScreenState();
}

class _FamilyObjectModifierPageScreenState extends State<FamilyObjectModifierPageScreen> {
  late final List<int> ages ;
  bool isFemale = true;
  late int minAge ;

  @override
  void initState() {
    ages = [18, 20, 24, 28];
    minAge = ages.first;
    super.initState();
  }

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
                final userRequest =
                    UserRequest(isFemale: isFemale, minAge: minAge);
                final future = watch.watch(userProvider(userRequest));

                return future.when(
                  data: (user) => UserWidget(user: user),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, stack) => const Center(child: Text('Not found',style: TextStyle(fontFamily: 'NotoSerif',fontSize: 28, fontWeight: FontWeight.bold),)),
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
              style: TextStyle(fontFamily: 'NotoSerif',fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildGenderSwitch(),
            const SizedBox(height: 16),
            _buildAgeDropdown(),
          ],
        ),
      );

  Widget _buildGenderSwitch() => Row(
        children: [
          const Text(
            'Female',
            style: TextStyle(fontFamily: 'NotoSerif',fontSize: 18,fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          CupertinoSwitch(
            value: isFemale,
            onChanged: (value) => setState(() => isFemale = value),
          ),
        ],
      );

  Widget _buildAgeDropdown() => Row(
        children: [
          const Text(
            'Minimum Age',
            style: TextStyle(fontFamily: 'NotoSerif', fontSize: 18,fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          DropdownButton<int>(
            value: minAge,
            iconSize: 32,
            style: const TextStyle(fontFamily: 'NotoSerif', fontSize: 16, color: Colors.black),
            onChanged: (value) => setState(() => minAge = value!),
            items: ages.map<DropdownMenuItem<int>>(
                    (int value) => DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value years old',
                            ),
                        ))
                .toList(),
          ),
        ],
      );
}
