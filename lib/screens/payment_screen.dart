import 'package:flutter/material.dart';
import 'package:mytravel/api/paymentapi.dart';
import 'package:mytravel/screens/confirm_pay.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  PaymentScreenState createState() => PaymentScreenState();
}

class PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = '';
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvv = '';
  String _mobileNumber = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                title: const Text('M-Pesa'),
                leading: Radio(
                  value: 'M-Pesa',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Credit Card'),
                leading: Radio(
                  value: 'Credit Card',
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value.toString();
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              if (_selectedPaymentMethod == 'Credit Card')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Credit Card Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Card Number',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter card number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _cardNumber = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Expiry Date',
                            ),
                            keyboardType: TextInputType.datetime,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter expiry date';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _expiryDate = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'CVV',
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter CVV';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _cvv = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (_selectedPaymentMethod == 'M-Pesa')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'M-Pesa Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _mobileNumber = value;
                        });
                      },
                    ),
                  ],
                ),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConfirmPayment()));
                      if (_selectedPaymentMethod == 'Credit Card') {
                        print('Processing credit card payment...');
                        print('Card Number: $_cardNumber');
                        print('Expiry Date: $_expiryDate');
                        print('CVV: $_cvv');
                      } else if (_selectedPaymentMethod == 'M-Pesa') {
                        print('Processing M-Pesa payment...');
                        print('Mobile Number: $_mobileNumber');
                        makePayments(_mobileNumber, 200);
                      }
                    }
                  },
                  child: const Text('Make Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
