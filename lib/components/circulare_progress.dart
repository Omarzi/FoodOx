import 'package:flutter/material.dart';

class AppCircular {
  static circularProgress({
    required Color color,
  }) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
