import 'package:flutter_test/flutter_test.dart';
import 'package:menu/screens/menu_screen.dart';

void main() {
  testWidgets('Проверить что  AppBar на главном экране имеет заголовок',
      (tester) async {
    await tester.pumpWidget(const MenuScreen());
    final appBarTitle = find.text('Меню');

    expect(appBarTitle, findsOneWidget);
  });
}
