import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final stopwatch = Stopwatch();
  String elapsedTime = '00:00:00.00';

  bool get isRunning => stopwatch.isRunning;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Habitu'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(elapsedTime),
            ElevatedButton(
              onPressed: isRunning ? stop : start,
              child: Text(isRunning ? 'Parar' : 'Iniciar'),
            ),
          ],
        ),
      ),
    );
  }

  start() {
    stopwatch.reset();
    stopwatch.start();
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 10));
      updateElapsedTime();
      return isRunning;
    });
  }

  stop() {
    stopwatch.stop();
    updateElapsedTime();
  }

  updateElapsedTime() {
    final elapsed = stopwatch.elapsed.toString();
    final elapsedTime = elapsed.substring(0, 10);
    setState(() => this.elapsedTime = elapsedTime);
  }
}
