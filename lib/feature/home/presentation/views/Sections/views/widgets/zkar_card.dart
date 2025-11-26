import 'dart:ui';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/painters/progress_border_painter.dart';
import 'package:al_rafiq/feature/home/presentation/views/Sections/views/widgets/zkar_explanation_dialog.dart';
import 'package:flutter/material.dart';

class ZkarCard extends StatefulWidget {
  const ZkarCard({
    super.key,
    required this.zkarText,
    required this.explanationZkar,
    required this.zkarNum,
    required this.numOfRepetitions,
    this.onEdit,
    this.onDelete,
  });

  final String zkarText;
  final String explanationZkar;
  final String zkarNum;
  final String numOfRepetitions;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<ZkarCard> createState() => _ZkarCardState();
}

class _ZkarCardState extends State<ZkarCard> with TickerProviderStateMixin {
  late int currentCount;
  late int totalCount;
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    totalCount = int.tryParse(widget.numOfRepetitions) ?? 1;
    currentCount = totalCount;

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _progressAnimation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(_progressController);

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant ZkarCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.numOfRepetitions != widget.numOfRepetitions) {
      setState(() {
        totalCount = int.tryParse(widget.numOfRepetitions) ?? 1;
        currentCount = totalCount;
        _updateProgress();
      });
    }
  }

  @override
  void dispose() {
    _progressController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (currentCount > 0) {
      _scaleController.forward().then((_) => _scaleController.reverse());
      setState(() {
        currentCount--;
        _updateProgress();
      });
    }
  }

  void _reset() {
    setState(() {
      currentCount = totalCount;
      _updateProgress();
    });
  }

  void _updateProgress() {
    double progress = (totalCount - currentCount) / totalCount;
    _progressAnimation =
        Tween<double>(begin: _progressAnimation.value, end: progress).animate(
          CurvedAnimation(parent: _progressController, curve: Curves.easeOut),
        );
    _progressController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_progressController, _scaleController]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: CustomPaint(
            painter: ProgressBorderPainter(
              progress: _progressAnimation.value,
              color: Theme.of(context).primaryColor,
              width: 4.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: currentCount == 0
                    ? Colors.grey[200]!.withOpacity(0.5)
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _handleTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 16),
                      _buildContent(context),
                      const SizedBox(height: 20),
                      _buildFooter(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            widget.zkarNum,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {}, // TODO: Implement share or audio
          icon: Icon(
            Icons.volume_up_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        PopupMenuButton<String>(
          icon: Icon(
            Icons.more_vert_rounded,
            color: Theme.of(context).primaryColor,
          ),
          onSelected: (value) {
            if (value == 'edit') {
              widget.onEdit?.call();
            } else if (value == 'delete') {
              widget.onDelete?.call();
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('تعديل'),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red, size: 20),
                  SizedBox(width: 8),
                  Text('حذف', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      widget.zkarText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 20,
        color: currentCount == 0 ? Colors.grey : Colors.black87,
        fontWeight: FontWeight.bold,
        height: 1.5,
        fontFamily: 'Amiri',
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: Text(
            currentCount == 0 ? 'اكتمل' : 'التكرار: $currentCount',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: _reset,
          icon: Icon(
            Icons.refresh_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => ZkarExplanationDialog(
                explanationZkar: widget.explanationZkar,
              ),
            );
          },
          icon: Icon(
            Icons.info_outline_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
