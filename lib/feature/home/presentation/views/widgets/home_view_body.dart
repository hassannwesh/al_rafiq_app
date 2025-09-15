import 'package:al_rafiq/feature/home/presentation/views/widgets/custom_list_view_time_pray.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/next_pray_widget.dart';
import 'package:al_rafiq/feature/home/presentation/views/widgets/prayer_time_update_widget.dart';
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
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TimePraySection(),
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
