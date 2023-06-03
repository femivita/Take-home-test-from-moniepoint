import 'package:flutter/material.dart';
import '../../constants/color.dart';
import '../../controllers/route_manager.dart';
import '../../resources/assets_manager.dart';

class PaymentAcknowledgementScreen extends StatefulWidget {
  const PaymentAcknowledgementScreen({super.key});

  @override
  State<PaymentAcknowledgementScreen> createState() =>
      PaymentAcknowledgementScreenState();
}

class PaymentAcknowledgementScreenState
    extends State<PaymentAcknowledgementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () =>  Navigator.of(context).pushNamed(RouteManager.mainScreen),
              child: const Icon(
                Icons.chevron_left,
                color: iconColor,
              ),
            );
          },
        ),
        actions: const [
           Icon(
            Icons.print,
            color: iconColor,
            size: 30,
          ),
          SizedBox(width:18),
        ]
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(AssetManager.success),
              const Text(
                'You have successfully completed this :)',
                style: TextStyle(
                  fontSize: 15,
                  color:greyFontColor,
                ),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
