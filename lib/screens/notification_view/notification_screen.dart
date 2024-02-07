import 'package:flutter/material.dart';
import 'package:shoppixa/utils/custom_buttons/custom_back_button.dart';

class NotificationScreen extends StatelessWidget {
  final Map<String, dynamic> dataFromNotification;

  const NotificationScreen({super.key, required this.dataFromNotification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 10.0,
          centerTitle: true,
          leading: CustomBackButton()),
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
