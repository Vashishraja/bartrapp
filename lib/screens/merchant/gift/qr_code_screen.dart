import 'package:flutter/material.dart';

class QRCodePage extends StatelessWidget {
  final Map<String, dynamic> giftCard;

  QRCodePage({required this.giftCard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Merchant Logo
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage(giftCard['logo']),
            ),
            SizedBox(height: 16),
            Text(
              giftCard['message'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 16),
            Text(
              'Amount: ₹${giftCard['amount']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            SizedBox(height: 32),
            // QR Code Placeholder
            Container(
              height: MediaQuery.of(context).size.width * 0.75,
              width: MediaQuery.of(context).size.width * 0.75,
              color: Colors.grey[300], // Replace with actual QR Code widget
              child: Center(child: Text('QR Code Placeholder')),
            ),
          ],
        ),
      ),
    );
  }
}
