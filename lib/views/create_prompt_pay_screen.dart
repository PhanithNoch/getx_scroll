import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePromptPayScreen extends StatefulWidget {
  @override
  _CreatePromptPayScreenState createState() => _CreatePromptPayScreenState();
}

class _CreatePromptPayScreenState extends State<CreatePromptPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Prompt Pay'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
             child:  FlatButton(
               onPressed: () {
                 Get.toNamed('home_prompt_pay_page');
               },
               child: Text('Pay'),
               color: Colors.pink,
             ),

            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
