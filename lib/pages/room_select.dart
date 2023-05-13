import 'package:flutter/material.dart';

class RoomSelectPage extends StatelessWidget {
  const RoomSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('예약하기'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Room Selection Page'),
        ),
      ),
    );
  }
}
