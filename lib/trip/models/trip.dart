import '../../core/constants/trip_status.dart';

class Trip {
  final String id;
  final String passenger;
  final String origin;
  final String destination;
  final String driver;
  final String vehicle;
  final TripStatus status;
  final double fare;
  final String distance;
  final String estimatedTime;
  final DateTime createdAt;

  const Trip({
    required this.id,
    required this.passenger,
    required this.origin,
    required this.destination,
    required this.driver,
    required this.vehicle,
    required this.status,
    this.fare = 450.0,
    this.distance = '7.8 km',
    this.estimatedTime = '16 min',
    required this.createdAt,
  });

  Trip copyWith({
    String? id,
    String? passenger,
    String? origin,
    String? destination,
    String? driver,
    String? vehicle,
    TripStatus? status,
    double? fare,
    String? distance,
    String? estimatedTime,
    DateTime? createdAt,
  }) {
    return Trip(
      id: id ?? this.id,
      passenger: passenger ?? this.passenger,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      driver: driver ?? this.driver,
      vehicle: vehicle ?? this.vehicle,
      status: status ?? this.status,
      fare: fare ?? this.fare,
      distance: distance ?? this.distance,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Trip.mockInitial() {
    return Trip(
      id: 'YA-1024',
      passenger: 'Carlos',
      origin: 'Baixa',
      destination: 'Costa do Sol',
      driver: 'João',
      vehicle: 'Toyota Corolla — ABC-12-34',
      status: TripStatus.searching,
      fare: 450.0,
      distance: '7.8 km',
      estimatedTime: '16 min',
      createdAt: DateTime.now(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Trip &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          passenger == other.passenger &&
          origin == other.origin &&
          destination == other.destination &&
          driver == other.driver &&
          vehicle == other.vehicle &&
          status == other.status &&
          fare == other.fare &&
          distance == other.distance &&
          estimatedTime == other.estimatedTime;

  @override
  int get hashCode =>
      id.hashCode ^
      passenger.hashCode ^
      origin.hashCode ^
      destination.hashCode ^
      driver.hashCode ^
      vehicle.hashCode ^
      status.hashCode ^
      fare.hashCode ^
      distance.hashCode ^
      estimatedTime.hashCode;
}
