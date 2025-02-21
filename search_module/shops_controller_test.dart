import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:recolearn_mobile/cache_manager.dart';
import 'package:recolearn_mobile/controllers/shops/shops_controller.dart';
import 'package:recolearn_mobile/models/auth/login_model/login_response_model.dart';
import 'package:recolearn_mobile/models/shops/category_by_id_model.dart';
import 'package:recolearn_mobile/models/shops/parent_category_model.dart' as t;
import 'package:recolearn_mobile/models/shops/product_by_id_model.dart';
import 'package:recolearn_mobile/models/shops/shops_model.dart' as a;
import 'package:recolearn_mobile/models/shops/sub_category_model.dart' as s;
import 'package:recolearn_mobile/services/shops/shops_service.dart';

import 'shops_controller_test.mocks.dart';

@GenerateMocks([ShopsService, CacheManager])
void main() {
  late ShopsController shopsController;
  late MockShopsService mockShopsService;
  late MockCacheManager mockCacheManager;
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    PathProviderPlatform.instance = FakePathProviderPlatform();
  });

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockShopsService = MockShopsService();
    mockCacheManager = MockCacheManager();
    shopsController = ShopsController();
    shopsController.shopsService = mockShopsService;
  });
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJhdXRoZW50aWNhdGlvbiI6eyJzdHJhdGVneSI6ImxvY2FsIiwiZW1haWwiOiJ5dXZyYWpAbmV1cmFwc2VzLmNvbSIsIm5vdGlmaWNhdGlvbl90b2tlbiI6IiIsInNvdXJjZSI6ImFiYyIsInBhY2thZ2VfbmFtZSI6Im1lY2hhdHJvbiJ9LCJzdWIiOiI2MTEzNWViYjEwZjA3YzAwMTE0YTBlZDMiLCJ1c2VyX2FnZW50IjoiRGFydC8zLjYgKGRhcnQ6aW8pIiwiaWF0IjoxNzQwMDI5MDIzLCJleHAiOjE3NDI2MjEwMjMsImF1ZCI6Imh0dHBzOi8veW91cmRvbWFpbi5jb20iLCJqdGkiOiJhMDEyZjA2YS1iNTVlLTQ1MzMtYWU3NC0wNDE0ZDZkMTI2ZTIifQ.jHju2Uieh1PhFntOROhG8gNHjBUByT3T9NemVOAB3OU";
  final mockResponse = LoginResponseModel(
    accessToken: token,
    user_id: "61135ebc10f07c00114a0ed5",
    name: "Yuvraj S. Sonone",
    email: "yuvraj@neurapses.com",
    mobile: "8523456155",
    id: "61135ebc10f07c00114a0ed5",
    storagePath: "https://files.neurapses.dev/mechatrondev/5f800d59c7c217001bad7c5b/",
    notificationToken: "notification_token",
    industryType: "College",
    accountId: "61135ebc10f07c00114a0ed4",
    accountCenterID: "5f800d59c7c217001bad7c5b",
  );

  ///getShopsCtrl
  test('getShopsCtrl fetches real shop data successfully', () async {
    when(mockCacheManager.getData()).thenReturn(mockResponse);

    final mockShopsResponse = a.ShopsModel(
      kits: [a.KitElement(title: "Kit 1")],
      recommendations: [a.Recommendation(title: "Recommendation 1")], // Add sample recommendations
      topCourses: [a.TopCourse(name: "Top Course 1")], // Add sample top courses
      assessments: [a.Assessment(name: "Assessment 1")], // Add sample assessments
    );
    when(mockShopsService.getShopsService(any)).thenAnswer((_) async => mockShopsResponse);

    await shopsController.getShopsCtrl();

    print("Real API Response: ${shopsController.shopsData.value.toJson()}");

    expect(shopsController.shopsData.value, isA<a.ShopsModel>());
  });

  ///getShopCategoryCtrl
  test('getShopCategoryCtrl fetches real category data', () async {
    final mockCategoryResponse = a.ShopsModel(
      kits: [a.KitElement(title: "Search Kit 11")],
      recommendations: [a.Recommendation(title: "Search Recommendation 1")],
      topCourses: [a.TopCourse(name: "Search Top Course 1")],
      assessments: [a.Assessment(name: "Search Assessment 1")],
    );
    when(mockShopsService.getShopsCategory(any, any)).thenAnswer((_) async => mockCategoryResponse);

    var result = await shopsController.getShopCategoryCtrl(category: "electronics");

    print("Category API Response: ${result.toJson()}");

    expect(result, isA<a.ShopsModel>());
  });

  ///getProductByIdCtrl
  test('getProductByIdCtrl fetches real product details', () async {
    final mockProductResponse = ProductByIdModel();
    var productId = "659cd151fecbc99d36fd9488"; // Replace with a valid product ID

    when(mockShopsService.getProductByIdService(any, any)).thenAnswer((_) async => mockProductResponse);

    var result = await shopsController.getProductByIdCtrl(productId: productId);

    print("Product API Response: ${result.toJson()}");

    expect(result, isA<ProductByIdModel>());
    expect(result, isNotNull); // Ensure product data is valid
  });

  /// getParentCtrl
  test('getParentCtrl fetches real parent category data', () async {
    final mockParentCategoryResponse = t.ParentCategoryModel(
      category: [
        t.ParentCat(id: "659cd151fecbc99d36fd9488", name: "Accountancy Exam 3"), // Add sample categories
        t.ParentCat(id: "679315359fb531fed7951557", name: "Hola"), // Add sample categories
        t.ParentCat(id: "6790aac9341a8565da0cdf7b", name: "ZEN"), // Add sample categories
      ],
    );

    when(mockCacheManager.getData()).thenReturn(mockResponse);
    when(mockShopsService.getParentCategory(any)).thenAnswer((_) async => mockParentCategoryResponse);

    var result = await shopsController.getParentCtrl();
    print("Parent Category API Response: ${result.toJson()}");

    expect(result, isA<a.ShopsModel>());
    expect(shopsController.parentCatList, isNotEmpty);
    expect(shopsController.parentCatList.length, greaterThan(0));
  });

  /// getShopsSearchCtrl
  test('getShopsSearchCtrl fetches shop data based on search query', () async {
    final mockSearchResponse = a.ShopsModel(
      kits: [a.KitElement(title: "Search Kit 1")],
      recommendations: [a.Recommendation(title: "Search Recommendation 1")],
      topCourses: [a.TopCourse(name: "Search Top Course 1")],
      assessments: [a.Assessment(name: "Search Assessment 1")],
    );

    when(mockCacheManager.getData()).thenReturn(mockResponse);
    when(mockShopsService.getShopsServiceSearch(any, any)).thenAnswer((_) async => mockSearchResponse);

    var result = await shopsController.getShopsSearchCtrl("search query");

    print("mock API Response: ${mockSearchResponse.toJson()}");
    print("Search API Response: ${result.toJson()}");

    expect(result, isA<a.ShopsModel>());
    expect(shopsController.shopsData.value.kits, isNotEmpty);
    expect(shopsController.shopsData.value.recommendations, isNotEmpty);
  });

  /// getByIdCategoryCtrl
  test('getByIdCategoryCtrl fetches category data by ID', () async {
    final mockCategoryResponse = CategoryByIdModel(
      kits: [KitElement(title: "Search Kit 1")],
      recommendations: [Recommendation(title: "Search Recommendation 1")],
      topCourses: [TopCourse(name: "Search Top Course 1")],
      categoty: Categoty(name: "holk"),
    );
    // Populate with sample data as per your model structure

    when(mockCacheManager.getData()).thenReturn(mockResponse);
    when(mockShopsService.getCategoryByIdService(any, any)).thenAnswer((_) async => mockCategoryResponse);

    var result = await shopsController.getByIdCategoryCtrl(category: "679315899fb531fed7951559");

    print("Mock Resposne  by ID API Response: ${mockCategoryResponse.toJson()}");
    print("Category by ID API Response: ${result.toJson()}");

    expect(result, isA<CategoryByIdModel>());
    expect(shopsController.byCategoryShopData.value, isNotNull);
  });

  /// getSubCtrl
  test('getSubCtrl fetches subcategory data by ID', () async {
    // Arrange: Set up the mock response
    final mockSubCategoryResponse = s.SubCategoryModel(
      category: [s.SubCat(id: "subcat1", name: "Subcategory 1")],
      recommendations: [s.Recommendation(title: "Recommendation 1")],
      kits: [s.KitElement(title: "Kit 1")],
    );

    // Mock the getData method to return a valid response
    when(mockCacheManager.getData()).thenReturn(mockResponse);

    // Mock the API call to return the mock response
    when(mockShopsService.getSubCategoryFromId(any, any)).thenAnswer((_) async => mockSubCategoryResponse);

    // Act: Call the getSubCtrl method with a test ID
    await shopsController.getSubCtrl("659cd151fecbc99d36fd9488");

    // Assert: Verify that the subCatList and other properties are populated correctly
    expect(shopsController.subCatList, isNotEmpty);
    expect(shopsController.subCatList.length, 1);
    expect(shopsController.subCatList.first.name, "Subcategory 1");

    expect(shopsController.recommended, isNotEmpty);
    expect(shopsController.recommended.first.title, "Recommendation 1");

    expect(shopsController.assetList, isNotEmpty);
    expect(shopsController.assetList.first.title, "Kit 1");

    print("Subcategory API Response: ${shopsController.subCatList}");
  });
}

class FakePathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String> getApplicationDocumentsPath() async => "/fake/path";
}
