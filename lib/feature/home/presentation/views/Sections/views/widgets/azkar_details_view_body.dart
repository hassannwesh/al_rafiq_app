import 'package:al_rafiq/feature/home/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:al_rafiq/feature/home/presentation/manager/azkar_cubit/azkar_state.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is AzkarSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: state.azkar.length,
            itemBuilder: (context, index) {
              final azkar = state.azkar[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: ZkarCard(
                  zkarText: azkar.dhikr,
                  explanationZkar: azkar.virtue,
                  zkarNum: (index + 1).toString(),
                  numOfRepetitions: azkar.repetitionCount.toString(),
                ),
              );
            },
          );
        } else if (state is AzkarFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
