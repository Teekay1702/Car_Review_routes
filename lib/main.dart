import 'package:car_review_routes/routes/routes.dart';
import 'package:car_review_routes/viewmodels/car_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //builds a tree of providers from multiple classes
    return MultiProvider(
      providers: [
        //create an instance of CarReviewViewModel class
        ChangeNotifierProvider(
          create: (context) => CarReviewViewModel(),
        ),
      ],
      child: const MaterialApp(
        // call onGenerateRoute from RouteManager to check which namedRoute (page) to display
        onGenerateRoute: RouteManager.onGenerateRoute,

        //first page to display
        initialRoute: RouteManager.mainPage,
      ),
    );
  }
}
