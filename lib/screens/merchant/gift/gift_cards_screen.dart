import 'package:bartrapp/screens/merchant/gift/make_gift_card_screen.dart';
import 'package:bartrapp/screens/merchant/gift/qr_code_screen.dart';
import 'package:flutter/material.dart';

class GiftCardPage extends StatefulWidget {
  @override
  _GiftCardPageState createState() => _GiftCardPageState();
}

class _GiftCardPageState extends State<GiftCardPage> {
  final List<Map<String, dynamic>> giftCards = [
    {
      'logo': 'assets/blogo.png', // Replace with actual merchant logo path
      'message': 'Happy Birthday! Enjoy your gift.',
      'amount': 500,
    },
    {
      'logo': 'assets/blogo.png', // Replace with actual merchant logo path
      'message': 'Congratulations on your achievement!',
      'amount': 1000,
    },
    {
      'logo': 'assets/blogo.png', // Replace with actual merchant logo path
      'message': 'Thank you for being a loyal customer.',
      'amount': 250,
    },
  ]; // Replace with dynamic data source if needed

  void _addGiftCard() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MakeGiftCardPage()));
  }

  void _shareGiftCard(Map<String, dynamic> giftCard) {
    // Share functionality placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sharing gift card: ₹${giftCard['amount']}')),
    );
  }

  // void _navigateToQRCodePage(Map<String, dynamic> giftCard) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => QRCodePage(giftCard: giftCard), // Replace with actual QRCodePage
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gift Cards',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _addGiftCard, // Add gift card functionality
            icon: const Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: giftCards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: _buildFancyGiftCard(giftCards[index]),
          );
        },
      ),
    );
  }

  Widget _buildFancyGiftCard(Map<String, dynamic> giftCard) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade800, Colors.lightBlue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Merchant Logo, Amount, and Share Button
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(giftCard['logo']),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '₹${giftCard['amount']}',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.share, color: Colors.white),
                onPressed: () => _shareGiftCard(giftCard),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Message Text
          Text(
            giftCard['message'],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          // Decorative Dotted Line
          Container(
            height: 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Redeem at Shreeji Traders',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
