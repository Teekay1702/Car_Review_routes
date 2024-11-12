import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/car_review.dart';
import '../../viewmodels/car_review_view_model.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Page'),
      ),
      body: SingleChildScrollView(
        child: Selector<CarReviewViewModel, CarReview>(
          selector: (context, viewModel) => viewModel.selectedReview!,
          builder: (context, selectedReview, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(
                    selectedReview.image,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    selectedReview.car,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(selectedReview.review),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
