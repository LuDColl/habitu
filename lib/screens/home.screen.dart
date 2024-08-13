import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final stopwatch = Stopwatch();
  String elapsedTime = '00:00:00.0';

  bool get isRunning => stopwatch.isRunning;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Habitu', style: textTheme.headlineMedium),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(elapsedTime, style: textTheme.displaySmall),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isRunning ? stop : start,
              child: Text(
                isRunning ? 'Parar' : 'Iniciar',
                style: textTheme.displaySmall,
              ),
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
      await Future.delayed(const Duration(milliseconds: 100));
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
    final elapsedTime = elapsed.substring(0, 9);
    setState(() => this.elapsedTime = elapsedTime);
  }
}
