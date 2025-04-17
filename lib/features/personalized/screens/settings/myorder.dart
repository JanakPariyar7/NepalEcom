import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text("My Order")),
      body: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder:
              (context, index) => SizedBox(height: JSizes.spacebtwnItems),
          itemCount: 7,
          itemBuilder:
              (context, index) => JReusableContainer(
                backgroundColor: const Color.fromARGB(137, 214, 212, 212),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Iconsax.clock),
                          SizedBox(width: JSizes.spacebtwnItems / 2),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Processing",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text("10 Novemnber 2024"),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.arrow_right),
                          ),
                        ],
                      ),
                      SizedBox(height: JSizes.spacebtwnItems / 2),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Iconsax.tag4),
                                SizedBox(width: JSizes.spacebtwnItems / 2),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text("Order"), Text("[15f5r5]")],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Row(
                              children: [
                                Icon(Iconsax.tag4),
                                SizedBox(width: JSizes.spacebtwnItems / 2),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Shipping Date"),
                                      Text("12 Nov 2025"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
