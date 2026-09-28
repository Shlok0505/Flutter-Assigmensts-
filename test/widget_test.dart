import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_assignment3/main.dart';

void main() {
  testWidgets('Profile card displays all core widgets and Spidey info', (WidgetTester tester) async {
    // Set screen size
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    // Build profile app
    await tester.pumpWidget(const ProfileApp());
    await tester.pumpAndSettle();

    // Verify key widgets are rendered
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(CircleAvatar), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Icon), findsWidgets);

    // Verify Spidey Indian profile information
    expect(find.text('Shlok Kamble (Spidey)'), findsOneWidget);
    expect(find.text('Senior Flutter Web-Slinger & Mobile Architect'), findsOneWidget);
    expect(find.text('Navi Mumbai, Maharashtra, India 🇮🇳'), findsOneWidget);
    expect(find.text('Follow Spidey'), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);

    // Test follow button interaction
    await tester.ensureVisible(find.text('Follow Spidey'));
    await tester.tap(find.text('Follow Spidey'));
    await tester.pumpAndSettle();
    expect(find.text('Patrolling'), findsOneWidget);

    // Test theme toggle button
    await tester.tap(find.byTooltip('Toggle Theme'));
    await tester.pumpAndSettle();
  });
}
