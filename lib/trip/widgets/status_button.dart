import 'package:flutter/material.dart';
import '../../core/constants/trip_status.dart';
import '../../core/theme/app_colors.dart';

/// Botão responsável por alterar o estado da viagem
class StatusButton extends StatelessWidget {
  final TripStatus currentStatus;
  final ValueChanged<TripStatus> onStatusChanged;
  final VoidCallback? onReset;

  const StatusButton({
    super.key,
    required this.currentStatus,
    required this.onStatusChanged,
    this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final nextStatus = currentStatus.nextStatus;
    final isTerminal = currentStatus.isTerminal;

    // Ícone correspondente à próxima ação
    IconData getActionIcon() {
      switch (currentStatus) {
        case TripStatus.searching:
          return Icons.person_pin_circle_outlined;
        case TripStatus.driverAssigned:
          return Icons.directions_car_filled_outlined;
        case TripStatus.inProgress:
          return Icons.check_circle_outline;
        case TripStatus.completed:
        case TripStatus.cancelled:
          return Icons.refresh_rounded;
      }
    }

    // Cores usando estritamente a paleta oficial (#FFFFFF, #389C9A, #FEDB71, #1D1D1D, #F8F8F8)
    Color getButtonBgColor() {
      switch (currentStatus) {
        case TripStatus.searching:
          return AppColors.accentYellow;
        case TripStatus.driverAssigned:
        case TripStatus.inProgress:
          return AppColors.accentTeal;
        case TripStatus.completed:
        case TripStatus.cancelled:
          return AppColors.textPrimary;
      }
    }

    Color getButtonFgColor() {
      switch (currentStatus) {
        case TripStatus.searching:
          return AppColors.textPrimary;
        case TripStatus.driverAssigned:
        case TripStatus.inProgress:
        case TripStatus.completed:
        case TripStatus.cancelled:
          return AppColors.bg;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossCrossAxisAlignment.stretch,
      children: [
        // Botão Principal de Avanço de Estado
        FilledButton.icon(
          onPressed: () {
            onStatusChanged(nextStatus);
          },
          icon: Icon(getActionIcon(), size: 20),
          label: Text(
            currentStatus.nextActionLabel,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          style: FilledButton.styleFrom(
            backgroundColor: getButtonBgColor(),
            foregroundColor: getButtonFgColor(),
            minimumSize: const Size.fromHeight(54),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Opção de cancelar quando a viagem ainda está em andamento
        if (!isTerminal) ...[
          OutlinedButton.icon(
            onPressed: () {
              onStatusChanged(TripStatus.cancelled);
            },
            icon: const Icon(Icons.close_rounded, size: 18, color: AppColors.textPrimary),
            label: const Text(
              'Cancelar Viagem',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(44),
              side: const BorderSide(color: AppColors.border, width: 1.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              backgroundColor: AppColors.secondary,
            ),
          ),
        ] else if (currentStatus == TripStatus.cancelled) ...[
          TextButton.icon(
            onPressed: () {
              onStatusChanged(TripStatus.searching);
            },
            icon: const Icon(Icons.restart_alt_rounded, size: 18),
            label: const Text('Tentar Novamente'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.accentTeal,
            ),
          ),
        ],
      ],
    );
  }
}
