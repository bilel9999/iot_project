import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLampOn = false;
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref().child('lamp_state');

  @override
  void initState() {
    super.initState();
    _databaseRef.onValue.listen((DatabaseEvent event) {
      final lampState = event.snapshot.value as int;
      setState(() {
        _isLampOn = lampState == 1;
      });
    });
  }

  void _toggleLamp(bool value) {
    setState(() {
      _isLampOn = value;
    });
    _databaseRef.set(_isLampOn ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isLampOn ? Colors.yellow.shade200 : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isLampOn ? 'Lamp On' : 'Lamp Off',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Transform.scale(
              scale: 1.5,
              child: Switch(
                value: _isLampOn,
                onChanged: _toggleLamp,
                activeColor: Colors.orange,
                activeTrackColor: Colors.yellowAccent,
                inactiveThumbColor: Colors.blueGrey,
                inactiveTrackColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
