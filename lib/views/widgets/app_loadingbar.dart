import 'package:flutter/material.dart';

class AppLoadingBar extends StatelessWidget {
  const AppLoadingBar({Key? key, required this.loadingText}) : super(key: key);

  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(loadingText),
          ],
        ),
      ),
    );
  }
}
