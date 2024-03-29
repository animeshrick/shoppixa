import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_back_button.dart';
import 'package:shoppixa/utils/custom_buttons/custom_elevated_btn.dart';
import 'package:uuid/uuid.dart';

import '../../utils/custom_text.dart';

class JuspayUI extends StatefulWidget {
  final HyperSDK hyperSDK;

  const JuspayUI({Key? key, required this.hyperSDK}) : super(key: key);

  @override
  _JuspayUIState createState() => _JuspayUIState();
}

class _JuspayUIState extends State<JuspayUI> {
  var countProductOne = 1;
  var countProductTwo = 0;

  @override
  Widget build(BuildContext context) {
    initiateHyperSDK();

    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: customText('Jus-pay', Colors.black, 18,
            fontWeight: FontWeight.w500),
        leading: CustomBackButton(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: const Color(0xFFF8F5F5),
            height: screenHeight / 12,
            child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Juspay Payments SDK should be initiated on this screen",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: const Text(
              "Products",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFfFB8D33),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: screenHeight / 1.75,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                singleProduct(screenHeight / 1.75, "one", countProductOne),
                singleProduct(screenHeight / 1.75, "two", countProductTwo)
              ],
            ),
          ),
          /*BottomButton(
              height: screenHeight / 10,
              text: "Go to Cart",
              onpressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                            productOneCount: countProductOne,
                            productTwoCount: countProductTwo,
                            hyperSDK: widget.hyperSDK,
                          ))))*/
          customButton(
              buttonText: "GO",
              onPressed: () {},
              buttonTextSize: 14,
              btnColor: appBaseColor),
        ],
      ),
    );
  }

  void initiateHyperSDK() async {
    // Check whether hyperSDK is already initialised
    if (!await widget.hyperSDK.isInitialised()) {
      // Getting initiate payload
      // block:start:get-initiate-payload
      var initiatePayload = {
        "requestId": const Uuid().v4(),
        "service": "in.juspay.hyperpay",
        "payload": {
          "action": "initiate",
          "merchantId": "<MERCHANT_ID>",
          "clientId": "<CLIENT_ID>",
          "environment": "production"
        }
      };
      // block:end:get-initiate-payload

      // Calling initiate on hyperSDK instance to boot up payment engine.
      // block:start:initiate-sdk
      await widget.hyperSDK.initiate(initiatePayload, initiateCallbackHandler);
      // block:end:initiate-sdk
    }
  }

  // Define handler for inititate callback
  // block:start:initiate-callback-handler
  void initiateCallbackHandler(MethodCall methodCall) {
    if (methodCall.method == "initiate_result") {
      // check initiate result
    }
  }

  // block:end:initiate-callback-handler

  Widget singleProduct(double height, String text, int itemCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: height / 2,
      child: Column(
        children: [
          Container(
            height: height / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 121, 119, 119)),
            child: Image.asset(
              text == 'one' ? 'assets/product1.png' : 'assets/product2.png',
              // Replace with the path to your image
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height / 4,
            color: const Color(0xFFFFFFFF),
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Product $text",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: "Price: Rs. 1/item",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        const TextSpan(text: "\n"),
                        const TextSpan(
                            text: "Awesome product description for",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        TextSpan(
                            text: "\nproduct $text",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black)),
                      ])),
                    ),
                    Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: height / 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => decreaseItemQuantity(text),
                                  child: const Icon(
                                    Icons.horizontal_rule_rounded,
                                    color: Color(0xFF115390),
                                  ),
                                ),
                                Text(
                                  itemCount.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFB8D33)),
                                ),
                                GestureDetector(
                                    onTap: () => increaseItemQuantity(text),
                                    child: const Icon(Icons.add,
                                        color: Color(0xFF115390)))
                              ],
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void increaseItemQuantity(String text) {
    if (text == "one") {
      setState(() {
        countProductOne += 1;
      });
    } else {
      setState(() {
        countProductTwo += 1;
      });
    }
  }

  void decreaseItemQuantity(String text) {
    if (text == "one") {
      setState(() {
        if (countProductOne != 0) {
          countProductOne -= 1;
        }
      });
    } else {
      setState(() {
        if (countProductTwo != 0) {
          countProductTwo -= 1;
        }
      });
    }
  }
}
