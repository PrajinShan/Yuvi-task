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
  static const fatGreen = Color(0xFF50CE58);

  /// Amber for the protein ring.
  static const proteinAmber = Color(0xFFE5A264);

  /// Muted purple for the carbs ring.
  static const carbsPurple = Color(0xFF695E94);

  /// ── Daily Breakdown screen (sampled from the day4 mockup) ──

  /// Lavender page background.
  static const breakdownBg = Color(0xFFF1EBF8);

  /// Soft tinted chips: protein (orange), carbs (purple), fats (green).
  static const chipOrangeBg = Color(0xFFFFF9F6);
  static const chipOrangeText = Color(0xFFE9C398);
  static const chipPurpleBg = Color(0xFFF7F5FF);
  static const chipPurpleText = Color(0xFFA78BFA);
  static const chipGreenBg = Color(0xFFF0FBF3);
  static const chipGreenText = Color(0xFF52CB73);

  /// Health-score ring green and status dots.
  static const healthGreen = Color(0xFF52CB73);
  static const dotGreen = Color(0xFFAAE6B9);
  static const dotRed = Color(0xFFB55449);
}
