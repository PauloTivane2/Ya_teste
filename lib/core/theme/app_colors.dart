import 'package:flutter/material.dart';
import '../constants/trip_status.dart';

/// Cores extraídas estritamente da paleta oficial da YA App:
/// - BG: #FFFFFF
/// - Accent (Teal): #389C9A
/// - Accent (Amarelo): #FEDB71
/// - Text: #1D1D1D
/// - Secondary: #F8F8F8
class AppColors {
  AppColors._();

  // As 5 Cores Oficiais da Identidade Visual
  /// BG: #FFFFFF
  static const Color bg = Color(0xFFFFFFFF);
  static const Color background = bg;

  /// Accent (Teal / Verde-azulado): #389C9A
  static const Color accentTeal = Color(0xFF389C9A);
  static const Color primary = accentTeal;

  /// Accent (Amarelo / Dourado): #FEDB71
  static const Color accentYellow = Color(0xFFFEDB71);
  static const Color secondaryAccent = accentYellow;

  /// Text: #1D1D1D
  static const Color textPrimary = Color(0xFF1D1D1D);

  /// Secondary (Superfícies, fundos secundários e cartões): #F8F8F8
  static const Color secondary = Color(0xFFF8F8F8);
  static const Color surface = secondary;
  static const Color cardBackground = bg;

  // Derivações de Opacidade estritamente baseadas em #1D1D1D e #FFFFFF
  static const Color textSecondary = Color(0x991D1D1D); // #1D1D1D com 60% opacidade
  static const Color textMuted = Color(0x611D1D1D);     // #1D1D1D com 38% opacidade
  static const Color border = Color(0x1F1D1D1D);        // #1D1D1D com 12% opacidade
  static const Color divider = Color(0x0F1D1D1D);       // #1D1D1D com 6% opacidade
  static const Color cardShadow = Color(0x0D1D1D1D);    // #1D1D1D com 5% opacidade

  // Tints com opacidade derivados estritamente dos Accents oficiais
  static const Color tealTint = Color(0x26389C9A);      // #389C9A com 15% opacidade
  static const Color yellowTint = Color(0x3DFEDB71);    // #FEDB71 com 24% opacidade

  // Cores Semânticas de Estado da Viagem (Feedback visual imediato)
  static const Color statusSearching = Color(0xFFF59E0B);    // Laranja / Âmbar
  static const Color statusSearchingBg = Color(0xFFFFFBEB);  // Laranja suave
  static const Color statusSearchingText = Color(0xFFB45309);

  static const Color statusDriverAssigned = Color(0xFF0284C7); // Azul celeste
  static const Color statusDriverAssignedBg = Color(0xFFF0F9FF);
  static const Color statusDriverAssignedText = Color(0xFF0369A1);

  static const Color statusInProgress = Color(0xFF2563EB);    // Azul vibrante
  static const Color statusInProgressBg = Color(0xFFEFF6FF);  // Azul suave
  static const Color statusInProgressText = Color(0xFF1D4ED8);

  static const Color statusCompleted = Color(0xFF10B981);     // Verde esmeralda
  static const Color statusCompletedBg = Color(0xFFECFDF5);   // Verde suave
  static const Color statusCompletedText = Color(0xFF047857);

  static const Color statusCancelled = Color(0xFFEF4444);     // Vermelho suave
  static const Color statusCancelledBg = Color(0xFFFEF2F2);
  static const Color statusCancelledText = Color(0xFFB91C1C);

  /// Cor principal associada a cada estado da viagem
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

  /// Cor de texto para alto contraste com o badge do status
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

  /// Cor de fundo do badge ou card para cada estado
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

  /// Cor da borda para cada estado
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
