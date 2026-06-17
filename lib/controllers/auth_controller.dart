import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _db = FirebaseFirestore.instance;

      UserModel? _currentUser;
        bool _isLoading = false;
          String? _verificationId;

            UserModel? get currentUser => _currentUser;
              bool get isLoading => _isLoading;

                Future<void> signOut() async {
                    await _auth.signOut();
                        _currentUser = null;
                            notifyListeners();
                              }

                                Future<void> verifyPhoneNumber(String phone, Function(String) onCodeSent) async {
                                    _isLoading = true;
                                        notifyListeners();

                                            try {
                                                  await _auth.verifyPhoneNumber(
                                                          phoneNumber: phone,
                                                                  verificationCompleted: (PhoneAuthCredential credential) async {
                                                                            await _auth.signInWithCredential(credential);
                                                                                    },
                                                                                            verificationFailed: (FirebaseAuthException e) {
                                                                                                      _isLoading = false;
                                                                                                                notifyListeners();
                                                                                                                          throw Exception(e.message);
                                                                                                                                  },
                                                                                                                                          codeSent: (String verificationId, int? resendToken) {
                                                                                                                                                    _verificationId = verificationId;
                                                                                                                                                              _isLoading = false;
                                                                                                                                                                        notifyListeners();
                                                                                                                                                                                  onCodeSent(verificationId);
                                                                                                                                                                                          },
                                                                                                                                                                                                  codeAutoRetrievalTimeout: (String verificationId) {
                                                                                                                                                                                                            _verificationId = verificationId;
                                                                                                                                                                                                                    },
                                                                                                                                                                                                                          );
                                                                                                                                                                                                                              } catch (e) {
                                                                                                                                                                                                                                    _isLoading = false;
                                                                                                                                                                                                                                          notifyListeners();
                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                                  Future<bool> verifyOtp(String smsCode, String name, String role) async {
                                                                                                                                                                                                                                                      if (_verificationId == null) return false;
                                                                                                                                                                                                                                                          _isLoading = true;
                                                                                                                                                                                                                                                              notifyListeners();

                                                                                                                                                                                                                                                                  try {
                                                                                                                                                                                                                                                                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                                                                                                                                                                                                                                                                                verificationId: _verificationId!,
                                                                                                                                                                                                                                                                                        smsCode: smsCode,
                                                                                                                                                                                                                                                                                              );

                                                                                                                                                                                                                                                                                                    UserCredential userCredential = await _auth.signInWithCredential(credential);
                                                                                                                                                                                                                                                                                                          if (userCredential.user != null) {
                                                                                                                                                                                                                                                                                                                  var userDoc = await _db.collection('users').doc(userCredential.user!.uid).get();
                                                                                                                                                                                                                                                                                                                          if (!userDoc.exists) {
                                                                                                                                                                                                                                                                                                                                    _currentUser = UserModel(
                                                                                                                                                                                                                                                                                                                                                uid: userCredential.user!.uid,
                                                                                                                                                                                                                                                                                                                                                            name: name,
                                                                                                                                                                                                                                                                                                                                                                        phoneNumber: userCredential.user!.phoneNumber ?? '',
                                                                                                                                                                                                                                                                                                                                                                                    role: role,
                                                                                                                                                                                                                                                                                                                                                                                              );
                                                                                                                                                                                                                                                                                                                                                                                                        await _db.collection('users').doc(_currentUser!.uid).set(_currentUser!.toMap());
                                                                                                                                                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                                                                                                                                                          _currentUser = UserModel.fromMap(userDoc.data()!);
                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                          _isLoading = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                  notifyListeners();
                                                                                                                                                                                                                                                                                                                                                                                                                                                          return true;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    } catch (e) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                          _isLoading = false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                notifyListeners();
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      return false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              return false;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                }import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  UserModel? _currentUser;
  bool _isLoading = false;
  String? _verificationId;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;

  Future<void> signOut() async {
    await _auth.signOut();
    _currentUser = null;
    notifyListeners();
  }

  Future<void> verifyPhoneNumber(String phone, Function(String) onCodeSent) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          _isLoading = false;
          notifyListeners();
          throw Exception(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          _isLoading = false;
          notifyListeners();
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> verifyOtp(String smsCode, String name, String role) async {
    if (_verificationId == null) return false;
    _isLoading = true;
    notifyListeners();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        var userDoc = await _db.collection('users').doc(userCredential.user!.uid).get();
        if (!userDoc.exists) {
          _currentUser = UserModel(
            uid: userCredential.user!.uid,
            name: name,
  