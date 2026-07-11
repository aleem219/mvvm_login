import 'package:flutter/material.dart';
import 'package:mvvm_login/res/components/custom_app_bar.dart';

class BusinessViewScreen extends StatefulWidget {
  @override
  _BusinessViewScreenState createState() => _BusinessViewScreenState();
}

class _BusinessViewScreenState extends State<BusinessViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Grid View', showBackButton: false),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                color: Colors.teal,
                child: Center(
                    child: Text('Item $index',
                        style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
            );
          }),
        ),
    );
  }
}