import 'package:al_rafiq/feature/home/presentation/views/widgets/ayat_muhkamat_widget.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/azkar_widget.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_list_view_sections.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/time_pray_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الرفيق'),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              TimePraySection(),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الاقسام',
                  textAlign: TextAlign.start,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: 15),
              CustomListViewSections(),
              SizedBox(height: 10),
              AyatMuhkamatWidget(),
              SizedBox(height: 10),
              AzkarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
