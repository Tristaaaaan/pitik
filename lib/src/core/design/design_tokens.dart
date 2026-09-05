// lib/core/design_tokens.dart
import 'package:flutter/material.dart';

/// -----------------------------
/// COLORS
/// -----------------------------
class AppColor {
  static const success = Color(0xFF10B981);
  static const warning = Color(0xFFFBBF24);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);
  static const pending = Color(0xFFF97316);
}

/// -----------------------------
/// SPACING
/// -----------------------------
class AppSpacing {
  // Extra small
  static const xs = 2.0;
  static const xs1 = 4.0;
  static const xs2 = 5.0;
  static const xs3 = 6.0;
  static const xs4 = 7.0;

  // Small
  static const sm = 8.0;
  static const sm1 = 10.0;
  static const sm2 = 12.0;
  static const sm3 = 14.0;

  // Medium
  static const md = 16.0;
  static const md1 = 18.0;
  static const md2 = 20.0;
  static const md3 = 22.0;
  static const md4 = 24.0;

  // Large
  static const lg = 28.0;
  static const lg1 = 32.0;
  static const lg2 = 36.0;
  static const lg3 = 40.0;
  static const lg4 = 44.0;
  static const lg5 = 48.0;

  // Extra large
  static const xl = 52.0;
  static const xl1 = 56.0;
  static const xl2 = 60.0;
  static const xl3 = 64.0;
}

/// -----------------------------
/// RADIUS / BORDER
/// -----------------------------
class AppRadius {
  // Extra small
  static const xs = 8.0; // small
  static const xs1 = 9.0; // slightly larger

  // Small
  static const sm = 10.0; // small
  static const sm1 = 12.0; // small-medium
  static const sm2 = 14.0; // small-medium

  // Medium
  static const md = 16.0; // medium
  static const md1 = 18.0; // medium
  static const md2 = 20.0; // medium-large
  static const md3 = 22.0; // medium-large
  static const md4 = 24.0; // medium-large
  static const md5 = 25.0; // medium-large 2
  // Large
  static const lg = 28.0; // large
  static const lg1 = 32.0; // large
  static const lg2 = 36.0; // large
  static const lg3 = 40.0; // large
  static const lg4 = 44.0; // large
  static const lg5 = 48.0; // large

  // Extra large
  static const xl = 50.0; // extra large
}

/// -----------------------------
/// TEXT SIZES
/// -----------------------------
class AppTextSize {
  // Extra small
  static const xxxxxxs = 2.0;

  static const xxxxxs = 4.0;

  static const xxxxs = 6.0;

  static const xxxs = 8.0;

  static const xxs = 10.0;

  static const xs = 12.0;

  // Small
  static const sm = 14.0;

  // Medium
  static const md = 16.0;
  static const md1 = 18.0;

  // Large
  static const lg = 20.0;

  // Extra large
  static const xl = 24.0;

  // Extra extra large
  static const xxl = 32.0;
  static const xxl1 = 36.0;
  static const xxl2 = 40.0;
  static const xxl3 = 44.0;

  // Huge / display
  static const xxxl = 48.0;
  static const xxxl1 = 52.0;
  static const xxxl2 = 56.0;
  static const xxxl3 = 60.0;
  static const xxxl4 = 64.0;
  static const xxxl8 = 150.0;
  static const xxxl12 = 228.0;
}

class AppIconSize {
  // Extra small
  static const xxxxxxs = 2.0;

  static const xxxxxs = 4.0;

  static const xxxxs = 6.0;

  static const xxxs = 8.0;

  static const xxs = 10.0;

  static const xs = 12.0;

  // Small
  static const sm = 14.0;

  // Medium
  static const md = 16.0;
  static const md1 = 18.0;

  // Large
  static const lg = 20.0;

  // Extra large
  static const xl = 24.0;

  // Extra extra large
  static const xxl = 32.0;
  static const xxl1 = 36.0;
  static const xxl2 = 40.0;
  static const xxl3 = 44.0;

  // Huge / display
  static const xxxl = 48.0;
  static const xxxl1 = 52.0;
  static const xxxl2 = 56.0;
  static const xxxl3 = 60.0;
  static const xxxl4 = 64.0;
  static const xxxl8 = 150.0;
  static const xxxl12 = 228.0;
}

/// -----------------------------
/// FONT WEIGHTS
/// -----------------------------
class AppFontWeight {
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
}
