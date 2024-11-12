import 'package:flutter/material.dart';

import '../../models/car_review.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({Key? key, required this.carReview, required this.onTap})
      : super(key: key);

  final CarReview carReview;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(carReview.car),
        trailing: Text(carReview.price),
        onTap: onTap,
      ),
    );
  }
}
