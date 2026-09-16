import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/trip_status.dart';
import '../../core/theme/app_colors.dart';

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

    IconData getActionIcon() {
      switch (currentStatus) {
        case TripStatus.searching:
          return LucideIcons.userCheck;
        case TripStatus.driverAssigned:
          return LucideIcons.car;
        case TripStatus.inProgress:
          return LucideIcons.circleCheck;
        case TripStatus.completed:
        case TripStatus.cancelled:
          return LucideIcons.rotateCcw;
      }
    }

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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

        if (!isTerminal) ...[
          OutlinedButton.icon(
            onPressed: () {
              onStatusChanged(TripStatus.cancelled);
            },
            icon: const Icon(LucideIcons.x, size: 18, color: AppColors.textPrimary),
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
            icon: const Icon(LucideIcons.rotateCcw, size: 18),
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
