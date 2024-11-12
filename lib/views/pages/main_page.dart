import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../routes/routes.dart';
import '../../viewmodels/car_review_view_model.dart';
import '../widgets/app_error.dart';
import '../widgets/app_loadingbar.dart';
import '../widgets/review_list_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Selector<CarReviewViewModel, List>(
              selector: (context, viewModel) => viewModel.reviews,
              builder: (context, reviews, child) {
                return ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return ReviewListItem(
                      carReview: reviews[index],
                      onTap: () {
                        context.read<CarReviewViewModel>().selectedReview =
                            reviews[index];
                        Navigator.of(context)
                            .pushNamed(RouteManager.reviewPage);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Selector<CarReviewViewModel, Tuple2>(
            selector: (context, viewModel) =>
                Tuple2(viewModel.loading, viewModel.loadingMessage),
            builder: (context, tuple, child) {
              return tuple.item1
                  ? AppLoadingBar(loadingText: tuple.item2)
                  : Container();
            },
          ),
          Selector<CarReviewViewModel, Tuple2>(
            selector: (context, viewModel) =>
                Tuple2(viewModel.error, viewModel.errorMessage),
            builder: (context, tuple, child) {
              return tuple.item1
                  ? AppError(
                      message: tuple.item2,
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
