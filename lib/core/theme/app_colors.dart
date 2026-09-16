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

  /// Cor principal associada a cada estado da viagem (usa apenas Accent Teal, Accent Amarelo ou Text)
  static Color getStatusColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return accentYellow;
      case TripStatus.driverAssigned:
      case TripStatus.inProgress:
      case TripStatus.completed:
        return accentTeal;
      case TripStatus.cancelled:
        return textPrimary;
    }
  }

  /// Cor de texto para alto contraste com o status
  static Color getStatusTextColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return textPrimary;
      case TripStatus.driverAssigned:
      case TripStatus.inProgress:
      case TripStatus.completed:
        return accentTeal;
      case TripStatus.cancelled:
        return textPrimary;
    }
  }

  /// Cor de fundo do badge ou banner para cada estado (usa apenas tints ou secondary)
  static Color getStatusBgColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return yellowTint;
      case TripStatus.driverAssigned:
      case TripStatus.inProgress:
      case TripStatus.completed:
        return tealTint;
      case TripStatus.cancelled:
        return secondary;
    }
  }

  /// Cor da borda para cada estado
  static Color getStatusBorderColor(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return accentYellow;
      case TripStatus.driverAssigned:
      case TripStatus.inProgress:
      case TripStatus.completed:
        return accentTeal;
      case TripStatus.cancelled:
        return border;
    }
  }
}
