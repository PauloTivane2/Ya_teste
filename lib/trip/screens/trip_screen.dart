import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/trip_status.dart';
import '../../core/theme/app_colors.dart';
import '../models/trip.dart';
import '../widgets/status_button.dart';
import '../widgets/trip_card.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accentYellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'YA',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Detalhes da Viagem',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Reiniciar simulação',
            icon: const Icon(LucideIcons.rotateCcw, size: 20),
            onPressed: () {
              setState(() {
                _trip = Trip.mockInitial();
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TripStatusCard(trip: _trip),
              const SizedBox(height: 16),
              TripRouteCard(trip: _trip),
              const SizedBox(height: 16),
              TripDriverCard(trip: _trip),
              const SizedBox(height: 16),
              TripPassengerCard(trip: _trip),
              const SizedBox(height: 20),
              _buildQuickStatusSelector(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColors.bg,
          border: Border(
            top: BorderSide(color: AppColors.border, width: 1.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: StatusButton(
            currentStatus: _trip.status,
            onStatusChanged: _updateTripStatus,
            onReset: () {
              setState(() {
                _trip = Trip.mockInitial();
              });
            },
          ),
        ),
      ),
    );
  }

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
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: TripStatus.values.map((status) {
              final isSelected = _trip.status == status;
              final chipColor = AppColors.getStatusColor(status);

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  selected: isSelected,
                  showCheckmark: false,
                  avatar: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? AppColors.bg : chipColor,
                    ),
                  ),
                  label: Text(
                    status.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? AppColors.bg : AppColors.textPrimary,
                    ),
                  ),
                  backgroundColor: AppColors.bg,
                  selectedColor: chipColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: isSelected ? chipColor : AppColors.border,
                      width: 1,
                    ),
                  ),
                  onSelected: (_) => _updateTripStatus(status),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
