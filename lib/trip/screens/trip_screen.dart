import 'package:flutter/material.dart';
import '../../core/constants/trip_status.dart';
import '../../core/theme/app_colors.dart';
import '../models/trip.dart';
import '../widgets/status_button.dart';
import '../widgets/trip_card.dart';

/// Tela principal de acompanhamento e gestão da viagem
/// Utiliza exclusivamente as 5 cores da paleta oficial (#FFFFFF, #389C9A, #FEDB71, #1D1D1D, #F8F8F8)
class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  late Trip _trip;

  @override
  void initState() {
    super.initState();
    _trip = Trip.mockInitial();
  }

  void _updateTripStatus(TripStatus newStatus) {
    setState(() {
      _trip = _trip.copyWith(status: newStatus);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              _getStatusIcon(newStatus),
              color: AppColors.accentYellow,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Estado atualizado: ${newStatus.label}',
                style: const TextStyle(
                  color: AppColors.bg,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.textPrimary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  IconData _getStatusIcon(TripStatus status) {
    switch (status) {
      case TripStatus.searching:
        return Icons.search_rounded;
      case TripStatus.driverAssigned:
        return Icons.directions_car_rounded;
      case TripStatus.inProgress:
        return Icons.navigation_rounded;
      case TripStatus.completed:
        return Icons.check_circle_rounded;
      case TripStatus.cancelled:
        return Icons.cancel_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text('Acompanhamento de Viagem'),
        actions: [
          IconButton(
            tooltip: 'Reiniciar dados da viagem',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                _trip = Trip.mockInitial();
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra de Progresso / Stepper Visual do Ciclo da Viagem
              _buildProgressTimeline(_trip.status),

              const SizedBox(height: 16),

              // Banner Contextual do Estado Atual
              _buildStatusBanner(_trip.status),

              const SizedBox(height: 20),

              // Card Principal com os Detalhes da Viagem
              TripCard(trip: _trip),

              const SizedBox(height: 24),

              // Seletor Rápido de Estados (Atalho para testar qualquer estado)
              _buildQuickStatusSelector(),

              const SizedBox(height: 20),

              // Botão Principal de Transição de Estado
              StatusButton(
                currentStatus: _trip.status,
                onStatusChanged: _updateTripStatus,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Constrói o indicador visual de progresso das etapas da viagem
  Widget _buildProgressTimeline(TripStatus currentStatus) {
    final stages = [
      TripStatus.searching,
      TripStatus.driverAssigned,
      TripStatus.inProgress,
      TripStatus.completed,
    ];

    final currentIndex = stages.indexOf(currentStatus);
    final isCancelled = currentStatus == TripStatus.cancelled;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: List.generate(stages.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Linha conectora entre os pontos
            final stepIndex = index ~/ 2;
            final isPassed = !isCancelled && currentIndex > stepIndex;
            return Expanded(
              child: Container(
                height: 3,
                color: isPassed ? AppColors.accentTeal : AppColors.border,
              ),
            );
          }

          // Ponto do estado
          final stepIndex = index ~/ 2;
          final stepStatus = stages[stepIndex];
          final isCompleted = !isCancelled && currentIndex > stepIndex;
          final isCurrent = !isCancelled && currentIndex == stepIndex;

          Color dotColor = AppColors.secondary;
          Widget? icon;

          if (isCancelled && isCurrent) {
            dotColor = AppColors.textPrimary;
            icon = const Icon(Icons.close, size: 14, color: AppColors.bg);
          } else if (isCompleted) {
            dotColor = AppColors.accentTeal;
            icon = const Icon(Icons.check, size: 14, color: AppColors.bg);
          } else if (isCurrent) {
            dotColor = AppColors.getStatusColor(stepStatus);
            icon = Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bg,
              ),
            );
          }

          return InkWell(
            onTap: () => _updateTripStatus(stepStatus),
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCurrent || isCompleted ? Colors.transparent : AppColors.border,
                  width: 1,
                ),
              ),
              child: Center(child: icon),
            ),
          );
        }),
      ),
    );
  }

  /// Banner com mensagem e cor contextual do estado
  Widget _buildStatusBanner(TripStatus status) {
    final textColor = AppColors.getStatusTextColor(status);
    final bgColor = AppColors.getStatusBgColor(status);
    final borderColor = AppColors.getStatusBorderColor(status);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(_getStatusIcon(status), color: textColor, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
                Text(
                  status.description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Seletor em chips para saltar e testar qualquer estado diretamente
  Widget _buildQuickStatusSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simulador de Estado (Teste Rápido)',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.textMuted,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: TripStatus.values.map((status) {
              final isSelected = _trip.status == status;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(status.label),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      _updateTripStatus(status);
                    }
                  },
                  selectedColor: AppColors.accentTeal,
                  backgroundColor: AppColors.bg,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? AppColors.bg : AppColors.textSecondary,
                  ),
                  side: BorderSide(
                    color: isSelected ? AppColors.accentTeal : AppColors.border,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  showCheckmark: false,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
