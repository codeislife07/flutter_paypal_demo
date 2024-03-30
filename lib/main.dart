import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_demo/paypal_ids.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void main() {
  runApp(const PaypalPaymentDemo());
}

class PaypalPaymentDemo extends StatelessWidget {
  const PaypalPaymentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaypalPaymentDemp',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>HomeScreenState();
}

class HomeScreenState  extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paypal Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: PayPalData.client_id,
                    secretKey: PayPalData.secret_id,
                    transactions: const [
                      {
                        "amount": {
                          "total": "30.11",
                          "currency": "USD",
                          "details": {
                            "subtotal": "30.00",
                            "tax": "0.07",
                            "shipping": "0.03",
                            "handling_fee": "1.00",
                            "shipping_discount": "-1.00",
                            "insurance": "0.01"
                          }
                        },
                        "description": "The payment transaction description.",
                        "custom": "EBAY_EMS_90048630024435",
                        "invoice_number": "48787589673",
                        "payment_options": {
                          "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
                        },
                        "soft_descriptor": "ECHI5786786",
                        "item_list": {
                          "items": [
                            {
                              "name": "hat",
                              "description": "Brown hat.",
                              "quantity": "5",
                              "price": "3",
                              "tax": "0.01",
                              "sku": "1",
                              "currency": "USD"
                            },
                            {
                              "name": "handbag",
                              "description": "Black handbag.",
                              "quantity": "1",
                              "price": "15",
                              "tax": "0.02",
                              "sku": "product34",
                              "currency": "USD"
                            }
                          ],
                          "shipping_address": {
                            "recipient_name": "Brian Robinson",
                            "line1": "4th Floor",
                            "line2": "Unit #34",
                            "city": "San Jose",
                            "country_code": "US",
                            "postal_code": "95131",
                            "phone": "011862212345678",
                            "state": "CA"
                          }
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      Navigator.pop(context);
                    },
                    onError: (error) {
                      log("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                      Navigator.pop(context);
                    },
                  ),
                ));
              },
              child: const Text('Pay with paypal'),
            ),
          ],
        ),
      ),
    );
  }
}