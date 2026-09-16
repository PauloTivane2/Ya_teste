/// Enum que representa todos os estados possíveis do ciclo de vida de uma viagem.
enum TripStatus {
  /// O passageiro solicitou a viagem e o sistema procura um motorista disponível.
  searching,

  /// O motorista aceitou a solicitação e está a deslocar-se para o ponto de recolha.
  driverAssigned,

  /// O passageiro embarcou e a viagem encontra-se a caminho do destino.
  inProgress,

  /// A viagem foi concluída com sucesso no destino final.
  completed,

  /// A viagem foi cancelada pelo passageiro ou pelo motorista.
  cancelled;

  /// Rótulo legível para exibição nas interfaces
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

  /// Descrição contextual do estado
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

  /// Texto de ação para o botão de transição de estado
  String get nextActionLabel {
    switch (this) {
      case TripStatus.searching:
        return 'Encontrar Motorista';
      case TripStatus.driverAssigned:
        return 'Iniciar Viagem';
      case TripStatus.inProgress:
        return 'Concluir Viagem';
      case TripStatus.completed:
      case TripStatus.cancelled:
        return 'Reiniciar Simulação';
    }
  }

  /// Próximo estado no ciclo de vida padrão da viagem
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

  /// Verifica se o estado é final
  bool get isTerminal => this == TripStatus.completed || this == TripStatus.cancelled;
}
