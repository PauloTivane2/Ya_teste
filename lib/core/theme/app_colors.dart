import 'package:flutter/material.dart';
import '../constants/trip_status.dart';

class AppColors {
  AppColors._();

  // Brand colors
  static const Color bg = Color(0xFFFFFFFF);
  static const Color background = bg;

  static const Color accentTeal = Color(0xFF389C9A);
  static const Color primary = accentTeal;

  static const Color accentYellow = Color(0xFFFEDB71);
  static const Color secondaryAccent = accentYellow;

  static const Color textPrimary = Color(0xFF1D1D1D);

  static const Color secondary = Color(0xFFF8F8F8);
  static const Color surface = secondary;
  static const Color cardBackground = bg;

  // Neutrals & opacity levels
  static const Color textSecondary = Color(0x991D1D1D);
  static const Color textMuted = Color(0x611D1D1D);
  static const Color border = Color(0x1F1D1D1D);
  static const Color divider = Color(0x0F1D1D1D);
  static const Color cardShadow = Color(0x0D1D1D1D);

  static const Color tealTint = Color(0x26389C9A);
  static const Color yellowTint = Color(0x3DFEDB71);

  // Status colors
  static const Color statusSearching = Color(0xFFF59E0B);
  static const Color statusSearchingBg = Color(0xFFFFFBEB);
  static const Color statusSearchingText = Color(0xFFB45309);

  static const Color statusDriverAssigned = Color(0xFF0284C7);
  static const Color statusDriverAssignedBg = Color(0xFFF0F9FF);
  static const Color statusDriverAssignedText = Color(0xFF0369A1);

  static const Color statusInProgress = Color(0xFF2563EB);
  static const Color statusInProgressBg = Color(0xFFEFF6FF);
  static const Color statusInProgressText = Color(0xFF1D4ED8);

  static const Color statusCompleted = Color(0xFF10B981);
  static const Color statusCompletedBg = Color(0xFFECFDF5);
  static const Color statusCompletedText = Color(0xFF047857);

  static const Color statusCancelled = Color(0xFFEF4444);
  static const Color statusCancelledBg = Color(0xFFFEF2F2);
  static const Color statusCancelledText = Color(0xFFB91C1C);

  static Color getStatusColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return statusSearching;
      case TripStatus.driverAssigned:
        return statusDriverAssigned;
      case TripStatus.inProgress:
        return statusInProgress;
      case TripStatus.completed:
        return statusCompleted;
      case TripStatus.cancelled:
        return statusCancelled;
    }
  }

  static Color getStatusTextColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return statusSearchingText;
      case TripStatus.driverAssigned:
        return statusDriverAssignedText;
      case TripStatus.inProgress:
        return statusInProgressText;
      case TripStatus.completed:
        return statusCompletedText;
      case TripStatus.cancelled:
        return statusCancelledText;
    }
  }

  static Color getStatusBgColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return statusSearchingBg;
      case TripStatus.driverAssigned:
        return statusDriverAssignedBg;
      case TripStatus.inProgress:
        return statusInProgressBg;
      case TripStatus.completed:
        return statusCompletedBg;
      case TripStatus.cancelled:
        return statusCancelledBg;
    }
  }

  static Color getStatusBorderColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return const Color(0xFFFDE68A);
      case TripStatus.driverAssigned:
        return const Color(0xFFBAE6FD);
      case TripStatus.inProgress:
        return const Color(0xFFBFDBFE);
      case TripStatus.completed:
        return const Color(0xFFA7F3D0);
      case TripStatus.cancelled:
        return const Color(0xFFFECACA);
    }
  }
}
