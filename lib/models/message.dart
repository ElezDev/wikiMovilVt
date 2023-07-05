import 'package:flutter/material.dart';

class Messages {
  final String? text;
  final DateTime date;
  final bool isSentByMe;
  final String? imageL;

  const Messages({
    this.text,
    required this.date,
    required this.isSentByMe,
    this.imageL,
  });
}
