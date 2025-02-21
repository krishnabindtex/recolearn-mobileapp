import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:recolearn_mobile/main.dart';
import 'package:recolearn_mobile/models/auth/login_model/login_response_model.dart';
import 'package:recolearn_mobile/views/recolearn/recolearn_dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class MockPathProvider extends Mock implements PathProvider {}
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  dynamic response;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    response = LoginResponseModel(); // Set up a mock or valid response
    response!.accessToken = 'valid_token'; // Mock PackageInfo to prevent MissingPluginException
    PackageInfo.setMockInitialValues(
      appName: 'Test App',
      packageName: 'com.example.test',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );

    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App launches and shows Dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(Duration(seconds: 5));

    expect(find.byType(RecolearnDashboardScreen), findsOneWidget);
  });
}
