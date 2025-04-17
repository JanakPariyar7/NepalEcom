import 'package:flutter/material.dart';

class JPricesInCheckoutSection extends StatelessWidget {
  const JPricesInCheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading: Text("Subtotal"), trailing: Text("Rs. 500")),
        ListTile(leading: Text("Shipping Fee"), trailing: Text("Rs. 25")),
        ListTile(leading: Text("Tax Fee"), trailing: Text("Rs. 39")),
        ListTile(
          leading: Text(
            "Order Total",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            "Rs. 564",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
