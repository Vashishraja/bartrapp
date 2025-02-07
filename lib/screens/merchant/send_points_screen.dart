import 'package:flutter/material.dart';

class SendPointScreen extends StatefulWidget {
  @override
  _SendPointScreenState createState() => _SendPointScreenState();
}

class _SendPointScreenState extends State<SendPointScreen> {
  final List<Map<String, String>> customers = [
    {'name': 'John Doe', 'number': '+91 9876543210'},
    {'name': 'Jane Smith', 'number': '+91 8765432109'},
    {'name': 'David Johnson', 'number': '+91 7654321098'},
    {'name': 'Emily Davis', 'number': '+91 6543210987'},
    {'name': 'Michael Brown', 'number': '+91 5432109876'},
  ]; // Replace with dynamic data if needed

  final Set<int> selectedCustomers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send Points',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
      SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.document_scanner,color: Colors.white,),
            Text(
              'Scan Gift',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return _buildCustomerTile(index);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedCustomers.isNotEmpty
                  ? () {
                // Logic to send points to selected customers
                _sendPoints();
              }
                  : null, // Disable if no customers are selected
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue
                ,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Send to ${selectedCustomers.length} Customers',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerTile(int index) {
    final customer = customers[index];
    final isSelected = selectedCustomers.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCustomers.remove(index);
          } else {
            selectedCustomers.add(index);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.indigo : Colors.lightBlue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer['name'] ?? '',
                  style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Colors.white : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  customer['number'] ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white70 : Colors.lightBlue.shade100,
                  ),
                ),
              ],
            ),
            Icon(
              isSelected
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: isSelected ? Colors.white : Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  void _sendPoints() {
    final selected = selectedCustomers.map((index) => customers[index]).toList();
    // Handle the send points logic here
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Points Sent'),
        content: Text(
          'You have sent points to the following customers:\n\n' +
              selected.map((customer) => customer['name']).join(', '),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
