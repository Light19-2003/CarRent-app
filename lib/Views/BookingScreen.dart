import 'package:carapp/Models/Car.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Booking Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Back button color
      ),
      body: Stack(
        children: [
          // Google Maps Background
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 14.0, // Slightly more zoomed in
              ),
              myLocationEnabled: true, // Show user location
              myLocationButtonEnabled: false, // We'll add our own
            ),
          ),

          // Booking Card
          Positioned(
            bottom: 16, // Reduced from 100 for better spacing
            left: 16,
            right: 16,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car Info Header
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${car.brand} ${car.name}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Chip(
                          backgroundColor: car.isElectric
                              ? Colors.green[100]
                              : Colors.blue[100],
                          label: Text(
                            car.isElectric ? 'ELECTRIC' : 'GASOLINE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: car.isElectric
                                  ? Colors.green[800]
                                  : Colors.blue[800],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Car Image and Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Car Image
                        Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset(
                            'assets/image/car.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Price and Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${car.price.toStringAsFixed(2)}/day',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Year: ${car.year}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                'Free cancellation',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Divider
                    const Divider(height: 1, thickness: 1),

                    const SizedBox(height: 16),

                    // Booking Details Section
                    const Text(
                      'PICKUP DETAILS',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      Icons.location_on,
                      '123 Main St, San Francisco',
                    ),
                    _buildDetailRow(Icons.calendar_today, 'Today, 3:00 PM'),
                    _buildDetailRow(Icons.timer, '2 days rental'),

                    const SizedBox(height: 16),

                    // Pay Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          // Handle payment
                          _showPaymentConfirmation(context);
                        },
                        child: const Text(
                          'CONFIRM & PAY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Floating Map Controls
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // Handle my location
                  },
                  child: const Icon(Icons.my_location, color: Colors.teal),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // Handle zoom in
                  },
                  child: const Icon(Icons.zoom_in, color: Colors.teal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.teal),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  void _showPaymentConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 60, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Booking Confirmed!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Your ${car.brand} ${car.name} is ready for pickup',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('VIEW BOOKING DETAILS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
