import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestShared extends StatefulWidget {
  const TestShared({Key? key}) : super(key: key);

  @override
  State<TestShared> createState() => _TestSharedState();
}

class _TestSharedState extends State<TestShared> {
  String? name = "user name";
  int? age = 10;

  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name!,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                age.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              TextFormField(
                onSaved: (value) {
                  name = value;
                },
              ),
              TextFormField(
                onSaved: (value) {
                  age = int.parse(value!);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _saveData();
                },
                child: const Text("Save Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      var value = sharedPreferences.getString("name");
      UserModel userModel =
          value == null ? UserModel() : UserModel.fromJson(json.decode(value!));
      print(userModel.toJson());
    });
  }

  _saveData() async {
    _globalKey.currentState!.save();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "userModel",
        jsonEncode(UserModel(
          name: name,
          email: "email",
          age: age,
        ).toJson()));

    print(sharedPreferences.getString("name"));
  }
}
