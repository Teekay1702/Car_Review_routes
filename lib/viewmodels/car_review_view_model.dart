import 'package:flutter/material.dart';

import '../models/car_review.dart';
import '../services/car_review_service.dart';

class CarReviewViewModel with ChangeNotifier {
  CarReviewViewModel() {
    fetchReviewData();
  }

  List<CarReview> _reviews = [];
  List<CarReview> get reviews => _reviews;

  CarReview? _selectedReview;
  CarReview? get selectedReview => _selectedReview;
  set selectedReview(CarReview? review) {
    _selectedReview = review;
    notifyListeners();
  }

  bool _error = false;
  bool get error => _error;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void startError(String message) {
    _error = true;
    _errorMessage = message;
    notifyListeners();
  }

  void stopError() {
    _error = false;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  String _loadingMessage = '';
  String get loadingMessage => _loadingMessage;

  void startLoading(String message) {
    _loading = true;
    _loadingMessage = message;
    notifyListeners();
  }

  void stopLoading() {
    _loading = false;
    notifyListeners();
  }

  void fetchReviewData() async {
    startLoading('Loading reviews...please wait...');

    try {
      _reviews = await CarReviewService.getCarReviewData();
      stopLoading();
    } catch (e) {
      stopLoading();
      startError(e.toString());
    }
  }
}
