import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: unused_field
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User? _user;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  _loadCurrentUser() async {
    _user = _auth.currentUser;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _user != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name: ${_user!.displayName ?? "Not available"}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Email: ${_user!.email ?? "Not available"}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/home');
                },
                child: Text('Home Screen'),
              ),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
