import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _name = 'User';
  String? _email = 'example@example.com';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'User';
      _email = prefs.getString('email') ?? 'example@example.com';
    });
  }

  Future<void> _saveProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name!);
    prefs.setString('email', _email!);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => _name = value,
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => _email = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfileData,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
