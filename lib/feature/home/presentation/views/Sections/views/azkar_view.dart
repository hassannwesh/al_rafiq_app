import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/azkar_view_body.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الأذكار ', style: TextStyle(fontSize: 28)),
      ),
      body: AzkarViewBody(),
    );
  }
}
