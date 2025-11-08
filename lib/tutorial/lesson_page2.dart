import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Gives structure to the screen
      appBar: AppBar(title: const Text('Lesson Page 2')),
      body: Padding(
        padding: EdgeInsets.all(16.0), // adds space around the text box
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefix: Icon(Icons.message),
            labelText: "Type your message",
            border: OutlineInputBorder(),
            suffix: InkWell(
              borderRadius: BorderRadius.circular(24),
              splashColor: Colors.blue,

              onTap: () {
                print("User typed: ${controller.text}");
                controller.clear();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.send),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
