import 'package:flutter/material.dart';

class ResendSection extends StatelessWidget {
  final VoidCallback onResend;

  const ResendSection({super.key, required this.onResend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Didn't receive the code? Check your spam folder or resend the code.",
          style: TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 127, 124, 124),
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: onResend,
          child: const Text(
            'Resend Code',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 127, 124, 124),
            ),
          ),
        ),
      ],
    );
  }
}
