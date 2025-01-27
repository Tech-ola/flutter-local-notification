import 'package:flutter/material.dart';
import 'package:prodlifymobile/Services/notifi_service.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        ElevatedButton(onPressed: (){
          NotificationService().showNotification(
            title: 'Sample title',
            body: 'It works!'
          );
      
        }, child: Text("Show Notification"),),
      ),
    );
  }
}