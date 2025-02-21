import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recolearn_mobile/controllers/shops/shops_controller.dart';
import 'package:recolearn_mobile/models/shops/shops_model.dart';
import 'package:recolearn_mobile/views/bot_nav/search_screen.dart';
import 'package:recolearn_mobile/views/bot_nav/sub_category_detail.dart';

import 'new_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ShopsController>()])
void main() {
  late MockShopsController mockShopsController;

  setUp(() {
    Get.testMode = true; // Enables GetX test mode
    mockShopsController = MockShopsController();
    Get.put<ShopsController>(mockShopsController);

    // Mock lifecycle methods
    when(mockShopsController.onInit()).thenAnswer((_) async {});
    when(mockShopsController.onReady()).thenAnswer((_) async {});
    when(mockShopsController.onDelete).thenReturn(InternalFinalCallback());
    when(mockShopsController.onStart).thenReturn(InternalFinalCallback());

    // Mock observables (Rx values)
    when(mockShopsController.isLoading).thenReturn(RxBool(false));
    when(mockShopsController.isStore).thenReturn(RxBool(false));
    when(mockShopsController.searchQuery).thenReturn(RxString(''));

    // Mock controller functions
    when(mockShopsController.getShopsSearchCtrl(any)).thenAnswer((_) async => ShopsModel());

    when(mockShopsController.getParentCtrl()).thenAnswer((_) async => ShopsModel());

    when(mockShopsController.getShopsCtrl()).thenAnswer((_) async => ShopsModel());
  });

  tearDown(() {
    Get.delete<ShopsController>(force: true);
  });

  testWidgets('Displays a search field', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: FitnessSearchScreen()));
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('Typing in search field calls search function', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: FitnessSearchScreen()));

    final searchField = find.byType(TextField);
    await tester.enterText(searchField, 'Yoga');
    await tester.pump();

    verify(mockShopsController.getShopsSearchCtrl('Yoga')).called(1);
  });

  testWidgets('Shows loading indicator when isLoading is true', (WidgetTester tester) async {
    when(mockShopsController.isLoading).thenReturn(RxBool(true));

    await tester.pumpWidget(const GetMaterialApp(home: FitnessSearchScreen()));
    await tester.pump(); // Allow UI to rebuild

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Switches to store view when isStore is true', (WidgetTester tester) async {
    when(mockShopsController.isStore).thenReturn(RxBool(true));

    await tester.pumpWidget(const GetMaterialApp(home: FitnessSearchScreen()));
    await tester.pump(); // Allow UI to rebuild

    expect(find.byType(SubCategoryDetailScreen), findsOneWidget);
  });

  testWidgets('Triggers refresh when pulled down', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: FitnessSearchScreen()));

    await tester.fling(find.byType(RefreshIndicator), const Offset(0, 300), 1000);
    await tester.pumpAndSettle();

    verify(mockShopsController.getParentCtrl()).called(1);
    verify(mockShopsController.getShopsCtrl()).called(1);
  });
}
