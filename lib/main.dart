import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MedicalHeartApp());
}

class MedicalHeartApp extends StatelessWidget {
  const MedicalHeartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MedicalDashboard(),
    );
  }
}

class MedicalDashboard extends StatefulWidget {
  const MedicalDashboard({super.key});

  @override
  State<MedicalDashboard> createState() => _MedicalDashboardState();
}

class _MedicalDashboardState extends State<MedicalDashboard>
    with TickerProviderStateMixin {
  late AnimationController heartController;

  final List<double> ecgData = [];

  double bpm = 72;
  double oxygen = 98;
  double pressure = 120;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    generateECG();

    timer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      setState(() {
        ecgData.add(generateECGPoint());

        if (ecgData.length > 120) {
          ecgData.removeAt(0);
        }

        bpm = 70 + Random().nextInt(10).toDouble();
        oxygen = 96 + Random().nextInt(3).toDouble();
      });
    });
  }

  double generateECGPoint() {
    final r = Random().nextDouble();

    if (r > 0.97) return 1.2;
    if (r > 0.94) return -0.5;

    return sin(DateTime.now().millisecondsSinceEpoch / 180) * 0.08;
  }

  void generateECG() {
    for (int i = 0; i < 120; i++) {
      ecgData.add(0);
    }
  }

  @override
  void dispose() {
    heartController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050B14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // Title
              const Text(
                "AI CARDIAC MONITOR",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 25),

              // Heart + stats
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: buildHeartMonitor(),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 4,
                      child: buildVitals(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ECG
              Container(
                height: 220,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.cyanAccent.withOpacity(0.4),
                  ),
                ),
                child: CustomPaint(
                  painter: ECGPainter(ecgData),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeartMonitor() {
    return AnimatedBuilder(
      animation: heartController,
      builder: (context, child) {
        double t = heartController.value;

        double scale = 1.0;

        if (t < 0.15) {
          scale = 1 + sin(t * pi / 0.15) * 0.18;
        } else if (t < 0.28) {
          scale = 1 - ((t - 0.15) * 0.4);
        } else if (t < 0.38) {
          scale = 1 + sin((t - 0.28) * pi / 0.10) * 0.08;
        }

        return Transform.scale(
          scale: scale,
          child: CustomPaint(
            size: const Size(260, 320),
            painter: RealHeartPainter(t),
          ),
        );
      },
    );
  }

  Widget buildVitals() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        vitalCard(
          "BPM",
          bpm.toStringAsFixed(0),
          Colors.redAccent,
        ),
        vitalCard(
          "OXYGEN",
          "${oxygen.toStringAsFixed(0)}%",
          Colors.cyanAccent,
        ),
        vitalCard(
          "PRESSURE",
          "$pressure mmHg",
          Colors.orangeAccent,
        ),
        vitalCard(
          "STATUS",
          "NORMAL",
          Colors.greenAccent,
        ),
      ],
    );
  }

  Widget vitalCard(String title, String value, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(0.03),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 14,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ECGPainter extends CustomPainter {
  final List<double> points;

  ECGPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = Colors.white10
      ..strokeWidth = 1;

    // Grid
    for (double x = 0; x < size.width; x += 20) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }

    for (double y = 0; y < size.height; y += 20) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (int i = 0; i < points.length; i++) {
      double x = (i / points.length) * size.width;
      double y = size.height / 2 - (points[i] * 70);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RealHeartPainter extends CustomPainter {
  final double t;

  RealHeartPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final pulse = 0.5 + (sin(t * pi * 2) * 0.5);

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.lerp(Colors.red.shade900, Colors.redAccent, pulse)!,
          Colors.red.shade700,
          Colors.red.shade300,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    path.moveTo(size.width * 0.52, size.height * 0.18);

    path.cubicTo(
      size.width * 0.15,
      size.height * 0.02,
      size.width * 0.02,
      size.height * 0.35,
      size.width * 0.20,
      size.height * 0.58,
    );

    path.cubicTo(
      size.width * 0.28,
      size.height * 0.78,
      size.width * 0.40,
      size.height * 0.95,
      size.width * 0.50,
      size.height * 0.98,
    );

    path.cubicTo(
      size.width * 0.65,
      size.height * 0.90,
      size.width * 0.92,
      size.height * 0.62,
      size.width * 0.88,
      size.height * 0.38,
    );

    path.cubicTo(
      size.width * 0.86,
      size.height * 0.12,
      size.width * 0.70,
      size.height * 0.04,
      size.width * 0.52,
      size.height * 0.18,
    );

    path.close();

    canvas.drawShadow(path, Colors.redAccent, 25, true);
    canvas.drawPath(path, paint);

    // Aorta
    final arteryPaint = Paint()
      ..color = Colors.red.shade100;

    final artery = Path();

    artery.moveTo(size.width * 0.48, size.height * 0.15);

    artery.cubicTo(
      size.width * 0.40,
      size.height * -0.05,
      size.width * 0.72,
      size.height * -0.02,
      size.width * 0.68,
      size.height * 0.18,
    );

    artery.lineTo(size.width * 0.60, size.height * 0.24);

    canvas.drawPath(artery, arteryPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}