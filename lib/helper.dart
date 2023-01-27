import 'package:flutter/material.dart';
import 'package:get/get.dart';

String formatTime(Duration duration) {
  int second = duration.inSeconds.remainder(60);
  return [duration.inMinutes, second].map((seg) => seg.toString().padLeft(2, '0')).join(':');
}

Future<bool?> confirm(String title) {
  return Get.dialog<bool?>(
    AlertDialog(
      content: Text(title),
      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      backgroundColor: Colors.black.withOpacity(0.9),
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: const Text(
            'Yes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: const Text(
            'No',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
