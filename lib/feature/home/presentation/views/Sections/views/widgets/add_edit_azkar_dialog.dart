import 'package:al_rafiq/feature/home/data/models/azkar_model.dart';
import 'package:flutter/material.dart';

class AddEditAzkarDialog extends StatefulWidget {
  const AddEditAzkarDialog({super.key, this.azkar});

  final AzkarModel? azkar;

  @override
  State<AddEditAzkarDialog> createState() => _AddEditAzkarDialogState();
}

class _AddEditAzkarDialogState extends State<AddEditAzkarDialog> {
  late TextEditingController _dhikrController;
  late TextEditingController _countController;
  late TextEditingController _virtueController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _dhikrController = TextEditingController(text: widget.azkar?.dhikr ?? '');
    _countController = TextEditingController(
      text: widget.azkar?.repetitionCount.toString() ?? '',
    );
    _virtueController = TextEditingController(text: widget.azkar?.virtue ?? '');
  }

  @override
  void dispose() {
    _dhikrController.dispose();
    _countController.dispose();
    _virtueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.azkar == null ? 'إضافة ذكر جديد' : 'تعديل الذكر',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dhikrController,
                  decoration: const InputDecoration(
                    labelText: 'نص الذكر',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال نص الذكر';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _countController,
                  decoration: const InputDecoration(
                    labelText: 'عدد التكرار',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال عدد التكرار';
                    }
                    if (int.tryParse(value) == null) {
                      return 'الرجاء إدخال رقم صحيح';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _virtueController,
                  decoration: const InputDecoration(
                    labelText: 'فضل الذكر (اختياري)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final azkar = AzkarModel(
                        dhikr: _dhikrController.text,
                        repetitionCount: int.parse(_countController.text),
                        virtue: _virtueController.text,
                      );
                      Navigator.of(context).pop(azkar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    widget.azkar == null ? 'إضافة' : 'حفظ التعديلات',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
