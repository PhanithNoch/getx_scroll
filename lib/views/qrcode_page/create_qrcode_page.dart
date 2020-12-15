import 'package:flutter/material.dart';
import 'package:getmoneyxapp/shared/components/reusable_card.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class CreateQRCodePage extends StatefulWidget {
  final String ownerPhoneNumber;
  final double amount;

  CreateQRCodePage({this.ownerPhoneNumber, this.amount});

  @override
  _CreateQRCodeScreenState createState() => _CreateQRCodeScreenState();
}

class _CreateQRCodeScreenState extends State<CreateQRCodePage> {
  String qrData = "";
  final qrdataFeed = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
          actions: <Widget>[],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ReusableCard(
                  colour: Colors.white,
                  cardChild: Container(
                    alignment: Alignment.center,
                    child: QrImage(
                      //plce where the QR Image will be shown
                      data: qrData,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
//             crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Prompt Pay Number : ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(widget.ownerPhoneNumber),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Amount : ',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text(widget.amount.toString()),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: RaisedButton(
                            child: Text('Save QR'),
                            onPressed: () {
                              Get.toNamed('report');
                            }),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: RaisedButton(
                              child: Text('Share'), onPressed: () {})),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
