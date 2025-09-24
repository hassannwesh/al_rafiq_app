import 'package:flutter/material.dart';
import 'dart:math' as math;

// Utility class for responsive screen sizing
class ScreenSize {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
}

/// Azkar Widget متوافق مع تطبيق الرفيق
/// مصمم ليتناسب مع الألوان الخضراء والتصميم الإسلامي
class AzkarWidget extends StatefulWidget {
  final double? customHeight;
  final double? customWidth;

  const AzkarWidget({Key? key, this.customHeight, this.customWidth})
    : super(key: key);

  @override
  State<AzkarWidget> createState() => _AzkarWidgetState();
}

class _AzkarWidgetState extends State<AzkarWidget>
    with TickerProviderStateMixin {
  // قائمة الأذكار - يمكن تخصيصها بسهولة
  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "استغفر الله",
  ];

  // خيارات العدد المتاحة
  final List<int> repetitionOptions = [3, 7, 10, 33, 100];

  // متغيرات الحالة
  int currentDhikrIndex = 0;
  int currentTapCount = 0;
  int selectedCount = 33;

  // متحكمات الحركة
  late AnimationController _progressController;
  late AnimationController _completionController;
  late Animation<double> _progressAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _completionController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _completionController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _progressController.dispose();
    _completionController.dispose();
    super.dispose();
  }

  /// التعامل مع النقر على الدائرة
  void _onCircleTap() {
    setState(() {
      currentTapCount++;
    });

    // حساب التقدم الجديد وتحريكه
    double newProgress = currentTapCount / selectedCount;
    _progressAnimation =
        Tween<double>(
          begin: _progressAnimation.value,
          end: newProgress,
        ).animate(
          CurvedAnimation(
            parent: _progressController,
            curve: Curves.easeOutCubic,
          ),
        );

    _progressController.forward(from: 0);

    // التحقق من اكتمال الذكر الحالي
    if (currentTapCount >= selectedCount) {
      _onDhikrComplete();
    }
  }

  /// التعامل مع اكتمال الذكر
  void _onDhikrComplete() {
    // تشغيل حركة الإكمال
    _completionController.forward().then((_) {
      _completionController.reverse();
    });

    // الانتقال للذكر التالي وإعادة تعيين العداد
    setState(() {
      currentTapCount = 0;
      currentDhikrIndex = (currentDhikrIndex + 1) % azkar.length;
    });

    // إعادة تعيين حركة التقدم
    _progressAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOutCubic),
    );

    _progressController.forward(from: 0);
  }

  /// التعامل مع تغيير عدد التكرارات
  void _onRepetitionChanged(int? newCount) {
    if (newCount != null) {
      setState(() {
        selectedCount = newCount;
        currentTapCount = 0;
      });

      _progressAnimation =
          Tween<double>(begin: _progressAnimation.value, end: 0.0).animate(
            CurvedAnimation(
              parent: _progressController,
              curve: Curves.easeOutCubic,
            ),
          );

      _progressController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة مثل تطبيق الرفيق
    final double widgetHeight =
        widget.customHeight ?? ScreenSize.height(context) * 0.3;
    final double widgetWidth =
        widget.customWidth ?? ScreenSize.width(context) * 0.95;

    return Container(
      height: widgetHeight,
      width: widgetWidth,
      // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // المحتوى الرئيسي
          Column(
            children: [
              // عنوان الأذكار
              _buildHeader(),

              // منطقة التقدم الدائري الرئيسي
              Expanded(
                child: _buildCircularProgress(widgetHeight, widgetWidth),
              ),

              // مؤشر التقدم ومحدد التكرارات
              _buildBottomSection(),
            ],
          ),
        ],
      ),
    );
  }

  /// بناء رأس الأذكار
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "يَا أَيُّهَا الَّذِينَ آمَنُوا اذْكُرُوا اللَّهَ ذِكْرًا كَثِيرًا",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  /// بناء التقدم الدائري مع نص الذكر
  Widget _buildCircularProgress(double containerHeight, double containerWidth) {
    // حساب حجم الدائرة بناءً على حجم الحاوية
    final double circleSize = math.min(
      containerHeight * 0.6,
      containerWidth * 0.5,
    );

    return AnimatedBuilder(
      animation: Listenable.merge([_progressAnimation, _scaleAnimation]),
      builder: (context, child) {
        return Center(
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: _onCircleTap,
              child: Container(
                width: circleSize,
                height: circleSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // الحلقة الدائرية للتقدم
                    CustomPaint(
                      size: Size(circleSize, circleSize),
                      painter: RafiqCircularProgressPainter(
                        progress: _progressAnimation.value,
                        dhikrIndex: currentDhikrIndex,
                      ),
                    ),

                    // نص الذكر في المركز
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            azkar[currentDhikrIndex],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: circleSize * 0.12,
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),

                          const SizedBox(height: 8),

                          // عداد التقدم
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "$currentTapCount / $selectedCount",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// بناء القسم السفلي
  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // محدد عدد التكرارات
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedCount,
                onChanged: _onRepetitionChanged,
                dropdownColor: const Color(0xFF2E7D32),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 18,
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                items: repetitionOptions.map((count) {
                  return DropdownMenuItem<int>(
                    value: count,
                    child: Text("$count"),
                  );
                }).toList(),
              ),
            ),
          ),

          // مساحة فارغة
          const SizedBox(),

          // زر إعادة التعيين
          GestureDetector(
            onTap: () {
              setState(() {
                currentTapCount = 0;
                currentDhikrIndex = 0;
              });

              _progressAnimation =
                  Tween<double>(
                    begin: _progressAnimation.value,
                    end: 0.0,
                  ).animate(
                    CurvedAnimation(
                      parent: _progressController,
                      curve: Curves.easeOutCubic,
                    ),
                  );

              _progressController.forward(from: 0);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.refresh, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

/// رسام مخصص للتقدم الدائري بألوان الرفيق
class RafiqCircularProgressPainter extends CustomPainter {
  final double progress;
  final int dhikrIndex;

  RafiqCircularProgressPainter({
    required this.progress,
    required this.dhikrIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;

    // رسام الحلقة الأساسية
    final basePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // ألوان التقدم متدرجة خضراء
    final progressColors = [
      const Color(0xFFB68F2E), // أخضر داكن جداً للذكر الخامس🎯🎯🎯
    ];

    final progressPaint = Paint()
      ..color = progressColors[dhikrIndex % progressColors.length]
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // رسم الدائرة الأساسية
    canvas.drawCircle(center, radius, basePaint);

    // رسم قوس التقدم
    if (progress > 0) {
      final sweepAngle = 2 * math.pi * progress;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, // البدء من الأعلى
        sweepAngle,
        false,
        progressPaint,
      );

      // رسم نقطة في نهاية القوس
      if (progress < 1.0) {
        final endAngle = -math.pi / 2 + sweepAngle;
        final endPoint = Offset(
          center.dx + radius * math.cos(endAngle),
          center.dy + radius * math.sin(endAngle),
        );

        final dotPaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

        canvas.drawCircle(endPoint, 4, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(RafiqCircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.dhikrIndex != dhikrIndex;
  }
}
