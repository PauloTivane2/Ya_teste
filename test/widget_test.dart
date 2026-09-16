import 'package:flutter_test/flutter_test.dart';
import 'package:ya_trip_challenge/main.dart';

void main() {
  testWidgets('TripScreen renderiza corretamente com dados iniciais', (WidgetTester tester) async {
    await tester.pumpWidget(const YaTripApp());

    // Verifica se a tela principal e os dados da viagem carregaram
    expect(find.text('Acompanhamento de Viagem'), findsOneWidget);
    expect(find.text('Carlos'), findsOneWidget);
    expect(find.text('Encontrar Motorista'), findsOneWidget);
  });
}
