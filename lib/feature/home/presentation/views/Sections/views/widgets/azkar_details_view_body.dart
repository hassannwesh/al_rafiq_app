import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';
import 'package:al_rafiq/feature/home/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:al_rafiq/feature/home/presentation/manager/azkar_cubit/azkar_state.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/add_edit_azkar_dialog.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsViewBody extends StatelessWidget {
  const AzkarDetailsViewBody({super.key, required this.category});

  final String category;

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
                  onEdit: () => _showEditDialog(context, azkar, index),
                  onDelete: () => _showDeleteDialog(context, index),
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

  Future<void> _showEditDialog(
    BuildContext context,
    AzkarModel azkar,
    int index,
  ) async {
    final result = await showDialog(
      context: context,
      builder: (context) => AddEditAzkarDialog(azkar: azkar),
    );
    if (result != null && context.mounted) {
      context.read<AzkarCubit>().updateAzkar(category, index, result);
    }
  }

  void _showDeleteDialog(BuildContext context, int index) {
    final cubit = context.read<AzkarCubit>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الذكر'),
        content: const Text('هل أنت متأكد من حذف هذا الذكر؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              cubit.deleteAzkar(category, index);
              Navigator.pop(context);
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
