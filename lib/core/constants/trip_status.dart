enum TripStatus {
  searching,
  driverAssigned,
  inProgress,
  completed,
  cancelled;

  String get label {
    switch (this) {
      case TripStatus.searching:
        return 'A procurar motorista';
      case TripStatus.driverAssigned:
        return 'Motorista encontrado';
      case TripStatus.inProgress:
        return 'Em viagem';
      case TripStatus.completed:
        return 'Concluída';
      case TripStatus.cancelled:
        return 'Cancelada';
    }
  }

  String get description {
    switch (this) {
      case TripStatus.searching:
        return 'A encontrar o motorista ideal mais próximo de si...';
      case TripStatus.driverAssigned:
        return 'Motorista encontrado e pronto para a viagem.';
      case TripStatus.inProgress:
        return 'Viagem em curso rumo ao destino selecionado.';
      case TripStatus.completed:
        return 'Chegou ao seu destino. Obrigado por viajar com a YA!';
      case TripStatus.cancelled:
        return 'Esta viagem foi cancelada.';
    }
  }

  String get nextActionLabel {
    switch (this) {
      case TripStatus.searching:
        return 'Confirmar motorista encontrado';
      case TripStatus.driverAssigned:
        return 'Iniciar viagem';
      case TripStatus.inProgress:
        return 'Concluir viagem';
      case TripStatus.completed:
      case TripStatus.cancelled:
        return 'Reiniciar simulação';
    }
  }

  TripStatus get nextStatus {
    switch (this) {
      case TripStatus.searching:
        return TripStatus.driverAssigned;
      case TripStatus.driverAssigned:
        return TripStatus.inProgress;
      case TripStatus.inProgress:
        return TripStatus.completed;
      case TripStatus.completed:
      case TripStatus.cancelled:
        return TripStatus.searching;
    }
  }

  bool get isTerminal => this == TripStatus.completed || this == TripStatus.cancelled;
}
