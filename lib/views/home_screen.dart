import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmoneyxapp/shared/components/reusable_card.dart';
import 'create_prompt_pay_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('home');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatePromptPayScreen()));
              },
              child: Container(
                height: 150,
                width: 200,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
//        color: Color(0xFF1D1E33),
                  color: Colors.pink,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.pink,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payment,
                              size: 80,
                            ),
                            Text(
                              "PROMPT PAY",
                              style: TextStyle(fontSize: 22),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 150,
                width: 200,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
//        color: Color(0xFF1D1E33),
                  color: Colors.pink,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.pink,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payments,
                              size: 80,
                            ),
                            Text(
                              "OTHERS PAY",
                              style: TextStyle(fontSize: 22),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('search');
              },
              child: Container(
                height: 150,
                width: 200,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
//        color: Color(0xFF1D1E33),
                  color: Colors.pink,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.pink,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_sharp,
                              size: 80,
                            ),
                            Text(
                              "Search",
                              style: TextStyle(fontSize: 22),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
