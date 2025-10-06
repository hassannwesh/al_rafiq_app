import 'package:flutter/material.dart';

class ZkarExplanationDialog extends StatelessWidget {
  const ZkarExplanationDialog({super.key, required this.explanationZkar});

  final String explanationZkar; // فضل الذكر أو الشرح

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'شرح الذكر',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Text(
          explanationZkar,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إغلاق', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}
