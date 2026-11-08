import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const DarkVirus());
}

class DarkVirus extends StatelessWidget {
  const DarkVirus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const VirusScreen(),
    );
  }
}

class VirusScreen extends StatefulWidget {
  const VirusScreen({super.key});

  @override
  State<VirusScreen> createState() => _VirusScreenState();
}

class _VirusScreenState extends State<VirusScreen> {
  Timer? timer;

  int progress = 0;
  int countdown = 10;
  String status = 'SYSTEM READY';
  bool started = false;
  bool finished = false;

  void startPrank() {
    timer?.cancel();

    setState(() {
      progress = 0;
      countdown = 10;
      started = true;
      finished = false;
      status = 'SIMULATED SCANNING...';
    });

    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (t) {
        if (!mounted) return;

        setState(() {
          progress += 2;

          if (progress >= 100) {
            progress = 100;
            t.cancel();
            status = 'SIMULATION COMPLETE';
            startCountdown();
          }
        });
      },
    );
  }

  void startCountdown() {
    timer?.cancel();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        if (!mounted) return;

        setState(() {
          countdown--;

          if (countdown <= 0) {
            t.cancel();
            finished = true;
            status = 'JUST A PRANK!';
          }
        });
      },
    );
  }

  void stopPrank() {
    timer?.cancel();

    setState(() {
      started = false;
      finished = false;
      progress = 0;
      status = 'SYSTEM READY';
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'DARK VIRUS',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: 5,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'HACKER SIMULATOR',
                style: TextStyle(
                  color: Colors.greenAccent,
                  letterSpacing: 3,
                ),
              ),

              const SizedBox(height: 45),

              Icon(
                finished
                    ? Icons.sentiment_very_satisfied
                    : Icons.warning_amber_rounded,
                size: 100,
                color: finished ? Colors.greenAccent : Colors.red,
              ),

              const SizedBox(height: 25),

              Text(
                finished
                    ? 'YOU GOT PRANKED!'
                    : status,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: finished ? Colors.greenAccent : Colors.red,
                ),
              ),

              const SizedBox(height: 25),

              if (started && !finished) ...[
                Text(
                  '$progress%',
                  style: const TextStyle(
                    fontSize: 38,
                    color: Colors.greenAccent,
                  ),
                ),

                const SizedBox(height: 15),

                LinearProgressIndicator(
                  value: progress / 100,
                  minHeight: 12,
                  backgroundColor: Colors.grey,
                  color: Colors.red,
                ),

                const SizedBox(height: 30),

                Text(
                  'COUNTDOWN: $countdown',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
              ],

              if (finished) ...[
                const SizedBox(height: 25),
                const Text(
                  '😂😂😂\n\nЭТО БЫЛ РОЗЫГРЫШ!\n\nТВОЙ ТЕЛЕФОН В ПОРЯДКЕ!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

              const SizedBox(height: 45),

              if (!started)
                ElevatedButton(
                  onPressed: startPrank,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                  ),
                  child: const Text(
                    'START PRANK',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              if (started)
                ElevatedButton(
                  onPressed: stopPrank,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                  ),
                  child: const Text(
                    'STOP / EXIT',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

              const SizedBox(height: 30),

              const Text(
                'SAFE PRANK SIMULATION',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}