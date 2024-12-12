import 'package:flutter/material.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: const Center(
        child: Text('Payment Options'),
      ),
    );
  }
}