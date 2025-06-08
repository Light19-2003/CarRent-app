import 'package:carapp/Models/Car.dart';
import 'package:carapp/Views/BookingScreen.dart';
import 'package:flutter/material.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // More professional color
        title: const Text(
          'Available Cars',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4, // Add subtle shadow
      ),
      backgroundColor: Colors.grey[100], // Light background for better contrast
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: carList.length,
          itemBuilder: (context, index) {
            final car = carList[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row with price and electric indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${car.price.toStringAsFixed(2)}/day',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        Chip(
                          backgroundColor: car.isElectric
                              ? Colors.green[100]
                              : Colors.blue[100],
                          label: Text(
                            car.isElectric ? 'Electric' : 'Gasoline',
                            style: TextStyle(
                              color: car.isElectric
                                  ? Colors.green[800]
                                  : Colors.blue[800],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Car image centered
                    Center(
                      child: Container(
                        height: 120,
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          "assets/image/car.png",
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.car_rental,
                                size: 60,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Car model and brand
                    Text(
                      '${car.brand} ${car.name}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Details row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDetailItem('Year', car.year.toString()),
                        _buildDetailItem('Seats', '4'), // Assuming 4 seats
                        _buildDetailItem(
                          'Transmission',
                          'Automatic',
                        ), // Example
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Book button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          // Add booking functionality

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingScreen(car: car),
                            ),
                          );
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
