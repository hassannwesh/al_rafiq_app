import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/azkar_details_view_body.dart';
import 'package:flutter/material.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('أذكار الصباح ', style: TextStyle(fontSize: 28)),
      ),
      body:AzkarDetailsViewBody() ,
    );
  }
}
