import 'package:flutter/cupertino.dart';

class NoInternetScreen extends StatelessWidget {
  final String message;
  final Function onPressed;
  const NoInternetScreen(
      {super.key, required this.message, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        CupertinoButton(onPressed: onPressed(), child: const Text('Reload'))
      ],
    );
  }
}
