import 'package:flutter/material.dart';
import 'package:shoppixa/screens/choose_location/choose_location.dart';
import 'package:shoppixa/utils/custom_buttons/custom_back_button.dart';
import 'package:shoppixa/utils/custom_text.dart';

class Addresses extends StatelessWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText('Your Address', Colors.black, 18,
            fontWeight: FontWeight.w500),
        leading: CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Add new address", Colors.black, 18,
                        fontWeight: FontWeight.w500),
                    const Icon(Icons.arrow_forward_ios, size: 15)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseCurrentLocation()),
                );
              },
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText("Use current location", Colors.black, 18,
                          fontWeight: FontWeight.w500),
                      const Icon(Icons.arrow_forward_ios, size: 15)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            customUnderlineText("Added Addresses", Colors.black, 18,
                fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (_, int index) {
                    return RadioListTile<String>(
                      value: "pickles",
                      groupValue: "_groceryItem",
                      onChanged: (String? value) {
                        // setState(() {
                        //   _groceryItem = value;
                        // });
                      },
                      title: Row(
                        children: [
                          customText('Animesh Banerjee, ', Colors.black, 17),
                          customText('700105', Colors.grey, 15,
                              fontWeight: FontWeight.w500),
                          Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: customText('Home', Colors.white, 12),
                            ),
                          )
                        ],
                      ),
                      subtitle: customOverflowText(
                          'Longer supporting text to demonstrate how the text wraps and the item from where',
                          Colors.grey,
                          16,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.normal),
                      contentPadding: EdgeInsets.zero,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
