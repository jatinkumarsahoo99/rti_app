import 'package:flutter/material.dart';

import '../../common_widget/common_button.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonButton(
          padding: const EdgeInsets.only(left: 16, right: 16,top: 20),
          buttonText: "Make Payment",
          // width: size.width * 0.35,
          // backgroundColor: const Color.fromRGBO(0, 0, 0, 0.58),
          onTap: () {
            Navigator.pushNamed(context, "/newApplicationDetails");
          },
        ),
      ),
    );
  }
}
