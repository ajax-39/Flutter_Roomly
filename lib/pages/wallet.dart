import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/widget_support.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double walletBalance = 0.0;
  List<Transaction> transactions = [];
  TextEditingController customAmountController = TextEditingController();
  
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    customAmountController.dispose();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Add money when payment succeeds
    double amount = _getAmountFromPaymentId(response.paymentId ?? '');
    addMoney(amount);
    
    Fluttertoast.showToast(
      msg: "Payment Successful: ${response.paymentId}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "Payment Failed: ${response.message}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "External Wallet Selected: ${response.walletName}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  // Helper method to retrieve amount from temporary storage based on payment ID
  // In a real app, you would probably get this from a server or database
  double _getAmountFromPaymentId(String paymentId) {
    // For now, return the amount from the customAmountController
    // or a default value if it's empty
    return double.tryParse(customAmountController.text) ?? 0.0;
  }
  
  void addMoney(double amount) {
    setState(() {
      walletBalance += amount;
      transactions.add(
        Transaction(
          amount: amount,
          date: DateTime.now(),
          isAdded: true,
        ),
      );
    });
  }
    void _showAddMoneyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Money'),
          content: TextField(
            controller: customAmountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter Amount',
              prefixText: '\$',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                if (customAmountController.text.isNotEmpty) {
                  double amount = double.tryParse(customAmountController.text) ?? 0;
                  if (amount > 0) {
                    Navigator.pop(context);
                    _openRazorpayCheckout(amount);
                  }
                }
              },
              child: Text('PROCEED TO PAYMENT'),
            ),
          ],
        );
      },
    );
  }
  
  void _openRazorpayCheckout(double amount) {
    // Convert amount to paise (Razorpay expects amount in the smallest currency unit)
    var options = {
      'key': 'rzp_test_BOiwsAnwyGPStA',
      'amount': (amount * 100).toInt(), // Convert to paise
      'name': 'Roomly.',
      'description': 'Wallet Recharge',
      'timeout': 300, // in seconds
      'prefill': {
        'contact': '9999999999', // You can get this from user data
        'email': 'user@example.com', // You can get this from user data
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'WALLET',
          style: AppWidget.headlinetextstyle(18),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // Wallet Balance Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Wallet',
                        style: AppWidget.normaltextstyle(16),
                      ),
                      Text(
                        '\$${walletBalance.toStringAsFixed(2)}',
                        style: AppWidget.headlinetextstyle(24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Quick Amount Buttons
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAmountButton(50),
                  _buildAmountButton(100),
                  _buildAmountButton(200),
                ],
              ),
            ),
            
            // Add Money Button
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _showAddMoneyDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add Money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            
            // Transactions List
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your transactions',
                    style: AppWidget.normaltextstyle(16),
                  ),
                  SizedBox(height: 10),
                  transactions.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'No transactions yet',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final transaction = transactions[index];
                            return _buildTransactionItem(transaction);
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAmountButton(double amount) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {
            customAmountController.text = amount.toString();
            _openRazorpayCheckout(amount);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            '${amount.toInt()}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.isAdded ? 'Money Added' : 'Payment',
                style: AppWidget.normaltextstyle(14),
              ),
              Text(
                DateFormat('MMM dd, yyyy').format(transaction.date),
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Text(
            '${transaction.isAdded ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: transaction.isAdded ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final double amount;
  final DateTime date;
  final bool isAdded;

  Transaction({
    required this.amount,
    required this.date,
    required this.isAdded,
  });
}
