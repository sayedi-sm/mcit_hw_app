import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _findController = TextEditingController(),
      _replaceController = TextEditingController(),
      _resultController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _findController,
                decoration: const InputDecoration(
                  hintText: 'Find',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _replaceController,
                decoration: const InputDecoration(
                  hintText: 'Replace',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultController.text = _resultController.text.replaceAll(
                        _findController.text.trim(),
                        _replaceController.text.trim());
                  });
                },
                child: const Text('Replace'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _resultController,
                maxLines: 8,
                decoration: const InputDecoration(
                  hintText: 'Your text here!',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
