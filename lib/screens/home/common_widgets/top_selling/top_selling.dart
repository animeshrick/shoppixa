import 'package:flutter/material.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_header.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_header_item.dart';

import '../product_model.dart';

class TopSelling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TopHeader(
            headerTitle: 'Top Selling',
            headerOnTap: () {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemCount: products.length,
                itemBuilder: (_, int index) {
                  return TopHeaderItem(product: products.elementAt(index));
                }),
          ),
        ],
      ),
    );
  }
}
