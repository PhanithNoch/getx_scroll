import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getmoneyxapp/shared/components/widgets/keyboard_actions_config.dart';
import 'package:getmoneyxapp/views/qrcode_page/create_qrcode_page.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:get/get.dart';

class PromptPayScreen extends StatefulWidget {
  @override
  _PromptPayScreenState createState() => _PromptPayScreenState();
}

class _PromptPayScreenState extends State<PromptPayScreen> {
  final FocusNode phoneNode = FocusNode();
  final FocusNode amountNode = FocusNode();
  final ownerPhoneNumberController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<KeyboardActionsItem> keyboardActionItems = [
      KeyboardActionsItem(
        focusNode: phoneNode,
      ),
      KeyboardActionsItem(
        focusNode: amountNode,
      ),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: KeyboardActions(
        config: buildConfig(context, keyboardActionItems),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Prompt Pay Number',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                    ),
                    controller: ownerPhoneNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    focusNode: phoneNode,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: amountController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    focusNode: amountNode,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: RaisedButton(
                            child: Text(
                              'Send',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              final ownerNumber =
                                  ownerPhoneNumberController.text;
                              final amount = amountController.text;
                              if (ownerNumber.isNotEmpty && amount.isNotEmpty) {
                                Get.to(CreateQRCodePage(
                                  ownerPhoneNumber: ownerNumber,
                                  amount: double.parse(amount),
                                ));
                              }
                            }),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: RaisedButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.red,
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
