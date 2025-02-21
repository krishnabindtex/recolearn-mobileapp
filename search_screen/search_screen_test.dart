import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recolearn_mobile/models/shops/shops_model.dart';
import 'package:recolearn_mobile/views/bot_nav/search_screen.dart';
import 'package:recolearn_mobile/controllers/shops/shops_controller.dart';

import '../new_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ShopsController>()])
void main() {
  late MockShopsController mockShopsController;
  setUp(() {
    Get.testMode = true; // Ensure GetX is in test mode
    mockShopsController = MockShopsController();

    // Stub the search function
    when(mockShopsController.getShopsSearchCtrl(mockShopsController.searchQuery.toString())).thenAnswer((_) async => ShopsModel());

    // Stub isLoading and searchQuery
    when(mockShopsController.isLoading).thenReturn(false.obs);
    when(mockShopsController.searchQuery).thenReturn(''.obs);

    Get.put<ShopsController>(mockShopsController);
  });

  tearDown(() {
    // Get.delete<ShopsController>();
  });

  testWidgets('FitnessSearchScreen has a search field', (WidgetTester tester) async {
    // Build the FitnessSearchScreen widget
    await tester.pumpWidget(const MaterialApp(home: FitnessSearchScreen()));

    // Verify that the search field is present
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('FitnessSearchScreen updates search results', (WidgetTester tester) async {
    // Build the FitnessSearchScreen widget
    await tester.pumpWidget(const MaterialApp(home: FitnessSearchScreen()));

    // Find the search field
    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);

    // Enter text into the search field
    await tester.enterText(searchField, 'Yoga');
    await tester.pump();
    verify(mockShopsController.getShopsSearchCtrl('Yoga')).called(1);

    // Verify that the search function is called
    //  final shopsController = Get.find<ShopsController>();
    // expect(shopsController.searchQuery.value, 'Yoga');
  });
  testWidgets('FitnessSearchScreen updates search results', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(GetMaterialApp(home: FitnessSearchScreen()));

    // Simulate entering a search term
    final searchField = find.byType(TextField);
    await tester.enterText(searchField, 'Yoga');
    await tester.pump();

    // Act
    final shopsController = Get.find<ShopsController>();
    shopsController.getShopsSearchCtrl('Yoga');

    // Assert
    expect(shopsController.searchQuery.value, 'Yoga');
    // You can also check if the results are displayed correctly
    // For example, if you have a method to get search results, you can verify that
  });

  /* testWidgets('FitnessSearchScreen shows loading indicator when loading', (WidgetTester tester) async {
    // Build the FitnessSearchScreen widget
    await tester.pumpWidget(const MaterialApp(home: FitnessSearchScreen()));

    // Simulate loading state
    final shopsController = Get.find<ShopsController>();
    shopsController.isLoading.value = true;

    // Rebuild the widget
    await tester.pump();

    // Verify that the loading indicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('FitnessSearchScreen displays categories', (WidgetTester tester) async {
    // Build the FitnessSearchScreen widget
    await tester.pumpWidget(const MaterialApp(home: FitnessSearchScreen()));

    // Simulate data loading
    final shopsController = Get.find<ShopsController>();
    shopsController.parentCatList.addAll([
      // Add mock data for categories
      ParentCat(name: 'Yoga', images: [
        'https://www.google.com/imgres?q=imgur&imgurl=https%3A%2F%2Fimages.wondershare.com%2Ffilmora%2Farticle-images%2Fimgur.jpg&imgrefurl=https%3A%2F%2Ffilmora.wondershare.com%2Fimgur%2Fwhat-is-imgur.html&docid=gsctu3V3nD5HNM&tbnid=_uaItb51Ud2Y-M&vet=12ahUKEwi-_evf2dGLAxVHj68BHctUMbMQM3oECGoQAA..i&w=2163&h=1100&hcb=2&ved=2ahUKEwi-_evf2dGLAxVHj68BHctUMbMQM3oECGoQAA'
      ]),
      ParentCat(name: 'Pilates', images: [
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftechwiser.com%2Fhow-to-get-imgur-links-on-computer-and-phone%2F&psig=AOvVaw3zMjk6v9bFdCm7axk6nV5-&ust=1740122003997000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCPCt_efZ0YsDFQAAAAAdAAAAABAE'
      ]),
    ]);

    // Rebuild the widget
    await tester.pump();

    // Verify that the categories are displayed
    expect(find.text('Yoga'), findsOneWidget);
    expect(find.text('Pilates'), findsOneWidget);
  });*/
}
