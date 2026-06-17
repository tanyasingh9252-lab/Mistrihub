import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job_model.dart';

class JobController extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
    bool _isLoading = false;

      bool get isLoading => _isLoading;

        Future<bool> postJob(JobPost job) async {
            _isLoading = true;
                notifyListeners();
                    try {
                          await _db.collection('jobs').doc(job.jobId).set(job.toMap());
                                _isLoading = false;
                                      notifyListeners();
                                            return true;
                                                } catch (e) {
                                                      _isLoading = false;
                                                            notifyListeners();
                                                                  return false;
                                                                      }
                                                                        }

                                                                          Stream<List<JobPost>> fetchJobs() {
                                                                              return _db.collection('jobs').orderBy('jobId', descending: true).snapshots().map((snapshot) {
                                                                                    return snapshot.docs.map((doc) => JobPost.fromMap(doc.data())).toList();
                                                                                        });
                                                                                          }

                                                                                            Future<bool> applyToJob(String jobId, String workerId) async {
                                                                                                try {
                                                                                                      await _db.collection('jobs').doc(jobId).update({
                                                                                                              'applicants': FieldValue.arrayUnion([workerId])
                                                                                                                    });
                                                                                                                          return true;
                                                                                                                              } catch (e) {
                                                                                                                                    return false;
                                                                                                                                        }
                                                                                                                                          }
                                                                                                                                          }import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job_model.dart';

class JobController extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> postJob(JobPost job) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _db.collection('jobs').doc(job.jobId).set(job.toMap());
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Stream<List<JobPost>> fetchJobs() {
    return _db.collection('jobs').orderBy('jobId', descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => JobPost.fromMap(doc.data())).toList();
    });
  }

  Future<bool> applyToJob(String jobId, String workerId) async {
    try {
      await _db.collection('jobs').doc(jobId).upda