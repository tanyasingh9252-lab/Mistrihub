import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends ChangeNotifier {
  late Razorpay _razorpay;
    bool _isProcessing = false;

      bool get isProcessing => _isProcessing;

        PaymentController() {
            _razorpay = Razorpay();
                _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
                    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
                        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
                          }

                            void openCheckout(double amount, String contact, String email) {
                                _isProcessing = true;
                                    notifyListeners();

                                        var options = {
                                              'key': 'rzp_test_YOUR_KEY', 
                                                    'amount': (amount * 100).toInt(), 
                                                          'name': 'MistriHub Services',
                                                                'description': 'Premium Subscription Plan',
                                                                      'prefill': {'contact': contact, 'email': email},
                                                                            'external': {
                                                                                    'wallets': ['paytm', 'phonepe', 'gpay']
                                                                                          }
                                                                                              };

                                                                                                  try {
                                                                                                        _razorpay.open(options);
                                                                                                            } catch (e) {
                                                                                                                  _isProcessing = false;
                                                                                                                        notifyListeners();
                                                                                                                            }
                                                                                                                              }

                                                                                                                                void _handlePaymentSuccess(PaymentSuccessResponse response) {
                                                                                                                                    _isProcessing = false;
                                                                                                                                        notifyListeners();
                                                                                                                                          }

                                                                                                                                            void _handlePaymentError(PaymentFailureResponse response) {
                                                                                                                                                _isProcessing = false;
                                                                                                                                                    notifyListeners();
                                                                                                                                                      }

                                                                                                                                                        void _handleExternalWallet(ExternalWalletResponse response) {
                                                                                                                                                            _isProcessing = false;
                                                                                                                                                                notifyListeners();
                                                                                                                                                                  }

                                                                                                                                                                    @override
                                                                                                                                                                      void dispose() {
                                                                                                                                                                          _razorpay.clear();
                                                                                                                                                                              super.dispose();
                                                                                                                                                                                }
                                                                                                                                                                                }import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends ChangeNotifier {
  late Razorpay _razorpay;
  bool _isProcessing = false;

  bool get isProcessing => _isProcessing;

  PaymentController() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout(double amount, String contact, String email) {
    _isProcessing = true;
    notifyListeners();

    var options = {
      'key': 'rzp_test_YOUR_KEY', 
      'amount': (amount * 100).toInt(), 
      'name': 'MistriHub Services',
      'description': 'Premium Subscription Plan',
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': ['paytm', 'phonepe', 'gpay']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      _isProcessing = false;
      notifyListeners();
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _isProcessing = false;
    notifyListeners();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _isProcessing = false;
    notifyListeners();
  }

  void _handleExternal