import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';

class SettingPage extends StatelessWidget {
  final String title;

  const SettingPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ScrollController horizontalController = ScrollController();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Vertical scroll section
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  itemCount: 9,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[(index + 1) * 100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Vertical Box ${index + 1}',
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 Horizontal scroll section
              Focus(
                autofocus: true, // ✅ allows keyboard focus
                onKeyEvent: (node, event) {
                  if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                    horizontalController.animateTo(
                      horizontalController.offset + 100,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    );
                    return KeyEventResult.handled;
                  } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                    horizontalController.animateTo(
                      horizontalController.offset - 100,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                    );
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: ListView.builder(
                      controller: horizontalController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors
                                .primaries[index % Colors.primaries.length], // ✅ moved here
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'Box ${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
