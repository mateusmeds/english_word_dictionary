import 'package:flutter/material.dart';

class DefaultErrorPage extends StatelessWidget {
  const DefaultErrorPage({super.key, this.onRetry});

  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Error'),
        const SizedBox(height: 20),
        Visibility(
          visible: onRetry != null,
          child: ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ),
      ],
    );
  }
}
