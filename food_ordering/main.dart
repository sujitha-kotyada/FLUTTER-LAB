import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Ordering App",
      home: Scaffold(
        backgroundColor: Colors.orange.shade50,
        appBar: AppBar(
          title: const Text("Food Ordering App"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FoodCard(
                name: "Pizza",
                price: "₹299",
                icon: Icons.local_pizza,
              ),
              FoodCard(
                name: "Burger",
                price: "₹149",
                icon: Icons.lunch_dining,
              ),
              FoodCard(
                name: "Biryani",
                price: "₹249",
                icon: Icons.rice_bowl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom FoodCard Widget
class FoodCard extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;

  const FoodCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Food Icon
          Icon(
            icon,
            size: 50,
            color: Colors.orange,
          ),

          const SizedBox(width: 15),

          // Food Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Add to Cart Button
          ElevatedButton(
            onPressed: () {
              print("$name added to cart");
            },
            child: const Text("ADD TO CART"),
          ),
        ],
      ),
    );
  }
}
