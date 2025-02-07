import 'package:bartrapp/screens/merchant/b2b/b2b_page.dart';
import 'package:bartrapp/screens/merchant/gift/gift_cards_screen.dart';
import 'package:bartrapp/screens/merchant/send_points_screen.dart';
import 'package:bartrapp/screens/merchant/trade/trade_page.dart';
import 'package:bartrapp/screens/merchant/vouchers/vouchers.dart';
import 'package:flutter/material.dart';

class MerchantHomePage extends StatelessWidget {
  const MerchantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildWalletSection(context),
            const SizedBox(height: 10),
            _buildActionContainers(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Merchant Name',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.lightBlue,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Image.asset('assets/blogo.png'),
      ),
      centerTitle: true,
    );
  }

  Widget _buildWalletSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Your Wallet Points',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '1,23,44,23,433',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SendPointScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Send Points',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionContainers(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionContainer(
              context,
              'assets/gift_card.png',
              'Gift Card',
              'Send Gift Cards to your friend and family',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GiftCardPage()),
                );
              },
            ),
            _buildActionContainer(
              context,
              'assets/voucher.png',
              'Vouchers',
              'Make a vouchers for in Store offers',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VoucherPage()),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionContainer(
              context,
              'assets/b2b.png',
              'B2B',
              'Seamless Transactions',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  B2BPage()),
                );
              },
            ),
            _buildActionContainer(
              context,
              'assets/trade.png',
              'Trade',
              'Exclusive Trade Offers',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  TradePage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionContainer(
      BuildContext context,
      String imagePath,
      String title,
      String subtitle,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
