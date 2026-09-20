import 'package:flutter/material.dart';

/// Colour tokens sampled from the mockup (see scratch analysis notes).
abstract final class AppColors {
  static const ink = Color(0xFF16110E); // near-black text and icons
  static const scaffold = Color(0xFFF0EFF2); // page background
  static const card = Color(0xFFFFFFFF); // white card surface
  static const muted = Color(0xFF747474); // secondary text
  static const ringTrack = Color(0xFFEDEDED); // grey ring track

  /// Purple gradient of the header card (top-left -> bottom-right).
  static const headerTop = Color(0xFFB48CF2);
  static const headerBottom = Color(0xFFDAC9F4);

  /// Green used by the small progress ring.
  static const progressGreen = Color(0xFF50CE58);
}
