import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';
import 'package:recolearn_mobile/controllers/auth/cache_manager.dart';
import 'package:recolearn_mobile/controllers/auth/login_controller.dart';
import 'package:recolearn_mobile/models/auth/login_model/login_request_model.dart';
import 'package:recolearn_mobile/services/auth/login_service.dart';
import 'package:recolearn_mobile/models/auth/login_model/login_response_model.dart';

import '../login_case/login_case_test.mocks.dart';

// Generate mock classes
@GenerateMocks([LoginService, AuthenticationManager])
void main() {
  late MockAuthenticationManager mockAuthManager;
  late LoginController loginController;
  late MockLoginService mockLoginService;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    const MethodChannel('plugins.flutter.io/path_provider').setMockMethodCallHandler((MethodCall methodCall) async {
      return '.';
    });

    await GetStorage.init();

    mockLoginService = MockLoginService();
    mockAuthManager = MockAuthenticationManager();

    loginController = LoginController(loginService: mockLoginService, authManager: mockAuthManager);
    loginController.isLoading = false.obs;
  });

  test('initial values should be correct', () {
    expect(loginController.isLoading.value, false);
  });

  testWidgets('should call login API and update state on success', (WidgetTester tester) async {
    // Arrange
    final loginRequest = LoginRequestModel(
      strategy: "local",
      email: "yuvraj@neurapses.com",
      password: "123456",
      source: "abc",
      notificationToken: "",
      packageName: "mechatron",
    );
    await tester.pumpWidget(GetMaterialApp(home: Scaffold(body: Container())));
    final loginResponse = LoginResponseModel(
      accessToken:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJhdXRoZW50aWNhdGlvbiI6eyJzdHJhdGVneSI6ImxvY2FsIiwiZW1haWwiOiJ5dXZyYWpAbmV1cmFwc2VzLmNvbSIsIm5vdGlmaWNhdGlvbl90b2tlbiI6IiIsInNvdXJjZSI6ImFiYyIsInBhY2thZ2VfbmFtZSI6Im1lY2hhdHJvbiJ9LCJzdWIiOiI2MTEzNWViYjEwZjA3YzAwMTE0YTBlZDMiLCJ1c2VyX2FnZW50IjoiRGFydC8zLjYgKGRhcnQ6aW8pIiwiaWF0IjoxNzM5NzkyOTY3LCJleHAiOjE3NDIzODQ5NjcsImF1ZCI6Imh0dHBzOi8veW91cmRvbWFpbi5jb20iLCJqdGkiOiIxMWE0YTBkNC0zZmFjLTRlZTgtOGYzMy04Y2RkYWI5YzY3NjEifQ.gYVbLZdkppRVsqFJUvHL4oRc4bCSihkZaZnh2ZYpldE",
      user_id: "61135ebb10f07c00114a0ed3",
      name: "Yuvraj S. Sonone",
      email: "yuvraj@neurapses.com",
      mobile: "8523456155",
      storagePath: "path",
      notificationToken: "",
      industryType: "Coaching Institute",
      accountId: "61135ebc10f07c00114a0ed4",
      accountCenterID: "61135ebc10f07c00114a0ed4",
      roles: [Role(id: "", name: "")],
    );

    when(mockLoginService.fetchLogin(any)).thenAnswer((Invocation invocation) {
      final LoginRequestModel request = invocation.positionalArguments.first as LoginRequestModel;

      // Simulate failure when an incorrect email is used
      if (request.email != "yuvraj@neurapses.com" || request.password != "123456") {
        return Future.error("Invalid email or password");
      }

      return Future.value(loginResponse);
    });
    // Act
    await loginController.loginUser(
      email: loginRequest.email,
      password: loginRequest.password,
      notificationToken: loginRequest.notificationToken,
      packageName: loginRequest.packageName,
      two_fa: false,
    );
    verify(mockLoginService.fetchLogin(argThat(isA<LoginRequestModel>()))).called(1);
    expect(loginController.isLoading.value, false);
  });
}
