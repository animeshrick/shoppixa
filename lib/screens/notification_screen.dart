import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final Map<String, dynamic> dataFromNotification;

  const NotificationScreen({super.key, required this.dataFromNotification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("NotificationScreen"),
            Text("ID : ${dataFromNotification['id']}"),
            Text("NAME : ${dataFromNotification['name']}"),
            Text("POSITION : ${dataFromNotification['position']}"),
            dataFromNotification['image'] != null
                ? Image.network(dataFromNotification['image'].toString())
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}