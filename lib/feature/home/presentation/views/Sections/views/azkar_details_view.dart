import 'package:al_rafiq/feature/home/data/repos/azkar_repo_impl.dart';
import 'package:al_rafiq/feature/home/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/azkar_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsView extends StatelessWidget {
  const AzkarDetailsView({
    super.key,
    required this.category,
    required this.title,
  });

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit(AzkarRepoImpl())..fetchAzkar(category),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title, style: const TextStyle(fontSize: 28)),
        ),
        body: const AzkarDetailsViewBody(),
      ),
    );
  }
}
