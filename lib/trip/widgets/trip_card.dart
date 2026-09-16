import 'package:flutter/material.dart';
import '../../core/constants/trip_status.dart';
import '../../core/theme/app_colors.dart';
import '../models/trip.dart';

/// Card elegante com todos os dados da viagem
/// Estilizado estritamente com as 5 cores da paleta oficial (#FFFFFF, #389C9A, #FEDB71, #1D1D1D, #F8F8F8)
class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({
    super.key,
    required this.trip,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = AppColors.getStatusColor(trip.status);
    final statusTextColor = AppColors.getStatusTextColor(trip.status);
    final statusBgColor = AppColors.getStatusBgColor(trip.status);
    final statusBorderColor = AppColors.getStatusBorderColor(trip.status);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border, width: 1.2),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          crossAxisAlignment: CrossCrossAxisAlignment.start,
          children: [
            // Cabeçalho do Card: Identificador e Badge do Estado
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.border, width: 1),
                        ),
                        child: const Icon(
                          Icons.local_taxi_rounded,
                          size: 18,
                          color: AppColors.accentTeal,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossCrossAxisAlignment.start,
                        children: [
                          const Text(
                            'VIAGEM CORPORATIVA',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                              color: AppColors.textMuted,
                            ),
                          ),
                          Text(
                            trip.id,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Badge do Estado Dinâmico
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: statusBorderColor, width: 1),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: statusColor,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          trip.status.label,
                          style: TextStyle(
                            color: statusTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Seção de Rota (Partida e Destino)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  // Ponto de Partida (Origem)
                  Row(
                    crossAxisAlignment: CrossCrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.accentTeal,
                                border: Border.all(color: AppColors.bg, width: 2.5),
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 38,
                              color: AppColors.border,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossCrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ponto de Partida',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textMuted,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              trip.origin,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Ponto de Chegada (Destino)
                  Row(
                    crossAxisAlignment: CrossCrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.accentYellow,
                            border: Border.all(color: AppColors.bg, width: 2.5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossCrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Destino',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textMuted,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              trip.destination,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Faixa de Informações da Viagem (Estimativas)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: AppColors.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoItem(
                    icon: Icons.straighten_rounded,
                    label: 'Distância',
                    value: trip.distance,
                  ),
                  _InfoItem(
                    icon: Icons.schedule_rounded,
                    label: 'Tempo Est.',
                    value: trip.estimatedTime,
                  ),
                  _InfoItem(
                    icon: Icons.payments_outlined,
                    label: 'Tarifa Est.',
                    value: '${trip.fare.toStringAsFixed(0)} Kz',
                  ),
                ],
              ),
            ),

            // Seção de Detalhes (Passageiro, Motorista, Veículo)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Passageiro
                  _DetailRow(
                    avatarIcon: Icons.person_rounded,
                    avatarBgColor: AppColors.secondary,
                    avatarFgColor: AppColors.textPrimary,
                    title: 'Passageiro',
                    subtitle: trip.passenger,
                  ),

                  const SizedBox(height: 14),
                  const Divider(),
                  const SizedBox(height: 14),

                  // Motorista e Veículo
                  _DetailRow(
                    avatarIcon: Icons.directions_car_rounded,
                    avatarBgColor: AppColors.secondary,
                    avatarFgColor: AppColors.accentTeal,
                    title: 'Motorista & Veículo',
                    subtitle: trip.driver,
                    secondarySubtitle: trip.vehicle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textSecondary),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossCrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.textMuted,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData avatarIcon;
  final Color avatarBgColor;
  final Color avatarFgColor;
  final String title;
  final String subtitle;
  final String? secondarySubtitle;
  final String? badgeText;

  const _DetailRow({
    required this.avatarIcon,
    required this.avatarBgColor,
    required this.avatarFgColor,
    required this.title,
    required this.subtitle,
    this.secondarySubtitle,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossCrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: avatarBgColor,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Icon(avatarIcon, size: 22, color: avatarFgColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossCrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                  if (badgeText != null) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: Text(
                        badgeText!,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: AppColors.accentTeal,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              if (secondarySubtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  secondarySubtitle!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
