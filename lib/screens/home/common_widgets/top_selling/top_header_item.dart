import 'package:flutter/material.dart';

import '../../../../utils/custom_text.dart';
import '../product_model.dart';

class TopHeaderItem extends StatelessWidget {
  final Product product;

  const TopHeaderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xfff5f1f1),
                ),
                width: 80,
                height: 30,
                alignment: Alignment.center,
                child: const Text(
                  "30% OFF",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              product.imageUrl,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xfff5f1f1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    product.name,
                    Colors.black,
                    16,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                      width: 200,
                      child: customOverflowText(
                          product.description, Colors.grey, 14,
                          maxLines: 2, textAlign: TextAlign.start)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "\$150",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(width: 3),
                      const Visibility(
                        visible: true,
                        child: Text(
                          "\$1500",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          /* Card(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  product.imageUrl,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
