import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:recolearn_mobile/models/assessments/all_assessment_model.dart';
import 'package:recolearn_mobile/models/assessments/assessments_model.dart';
import 'package:recolearn_mobile/models/recolearn/recolearn_dashboard_response_model.dart';
import 'package:recolearn_mobile/services/auth/login_service.dart';
import 'package:recolearn_mobile/services/recolearn/dahboard_service.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String> getApplicationDocumentsPath() async => './test';
}

void setupTestPathProvider() {
  PathProviderPlatform.instance = MockPathProviderPlatform();
}

@GenerateMocks([http.Client])
void main() {
  setupTestPathProvider(); // Mock path_provider for tests
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late LoginService loginService;
  late RecolearnDashboardService dashboardService;
  // late MockClient mockHttpClient;
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6ImFjY2VzcyJ9.eyJhdXRoZW50aWNhdGlvbiI6eyJzdHJhdGVneSI6ImxvY2FsIiwiZW1haWwiOiJ5dXZyYWpAbmV1cmFwc2VzLmNvbSIsIm5vdGlmaWNhdGlvbl90b2tlbiI6IiIsInNvdXJjZSI6ImFiYyIsInBhY2thZ2VfbmFtZSI6Im1lY2hhdHJvbiJ9LCJzdWIiOiI2MTEzNWViYjEwZjA3YzAwMTE0YTBlZDMiLCJ1c2VyX2FnZW50IjoiRGFydC8zLjYgKGRhcnQ6aW8pIiwiaWF0IjoxNzM5ODYzMDUzLCJleHAiOjE3NDI0NTUwNTMsImF1ZCI6Imh0dHBzOi8veW91cmRvbWFpbi5jb20iLCJqdGkiOiJiYmZkNDcwZi02ODZiLTRiNDktOGU5Zi01M2VjNTc3NTg1OGIifQ.ggTjTYkTyEEjimRftXk4jCjARpVfYB421NmGU5FcZek";

  setUp(() async {
    // mockHttpClient = MockClient();
    loginService = LoginService();
    WidgetsFlutterBinding.ensureInitialized();
    dashboardService = RecolearnDashboardService(client: http.Client());
  });

  group("RecolearnDashboardService Tests", () {
    test("getDashboardService() should return real dashboard data", () async {
      final result = await dashboardService.getDashboardService(token: token);

      expect(result, isA<RecolearnDashboardResponseModel>());
    });

    test("getDashboardService() should throw an error if response is not 200", () async {
      expect(() async => await dashboardService.getDashboardService(token: "invalid_token"), throwsException);
    });

    /// Test for getMyAssessmentsService()
    test("getMyAssessmentsService() should return real assessment data", () async {
      final result = await dashboardService.getMyAssessmentsService(token: token);

      expect(result, isA<AssessmentsModel>());
    });

    test("getMyAssessmentsService() should throw an error if response is not 200", () async {
      expect(() async => await dashboardService.getMyAssessmentsService(token: "invalid_token"), throwsException);
    });

    /// Test for getAllAssessmentsService()
    test("getAllAssessmentsService() should return real all assessments data", () async {
      final result = await dashboardService.getAllAssessmentsService(token: token);

      expect(result, isA<AllAssessmentsModel>());
    });

    test("getAllAssessmentsService() should throw an error if response is not 200", () async {
      expect(() async => await dashboardService.getAllAssessmentsService(token: "invalid_token"), throwsException);
    });

    /// Test for checkBlocked()
    test("checkBlocked() should return 200 if course is not blocked", () async {
      final result = await dashboardService.checkBlocked(token, "61e0140a1e66160015d1fdfb");

      expect(result, 200);
    });

    test("checkBlocked() should return 400 if course is blocked", () async {
      final result = await dashboardService.checkBlocked(token, "course123");

      expect(result, 400);
    });
  });

  /*group("RecolearnDashboardService Tests", () {
    test("getDashboardService() should return dashboard data", () async {
      final mockResponse = '''
      {
  "total_completed_courses": 1,
  "completed_courses": [
    {
      "_id": "61a8a2dcae177c0012062174",
      "complete_percent": 0,
      "product": {
        "_id": "61a60e61f7fc500012c4868a",
        "images": [
          {"url": "docs/file/1721376419572-22985-Level_8__1__jpg.jpeg"},
          {"url": "products/61a60e61f7fc500012c4868a/image/1689935452672-7804-gradeimg_png.png", "default": true},
          {"url": ""}
        ],
        "title": "Arduino Manual with Robo Champ Kit"
      }
    }
  ],
  "total_active_courses": 26,
  "active_courses": []
}
''';

      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(mockResponse, 200),
      );

      final result = await dashboardService.getDashboardService(token: "test_token");

      expect(result, isA<RecolearnDashboardResponseModel>());
      verify(mockHttpClient.get(any, headers: anyNamed("headers"))).called(1);
    });

    test("getDashboardService() should throw an error if response is not 200", () async {
      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response("Error", 400),
      );

      expect(() async => await dashboardService.getDashboardService(token: "test_token"), throwsException);
    });

    ///    Test for getMyAssessmentsService()
    test("getMyAssessmentsService() should return assessment data", () async {
      final mockResponse = '''
      {
      "data":{
      "all":[],
      "completed":[],
      "info":{
       "completed_assessments": 3,
        "ongoing_assessments": 3,
        "trending_assessments": [],
        "rank": 13,
        "domain": "https://recolearn.neurapses.dev"
        }
      },
      }
      ''';

      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(mockResponse, 200),
      );

      final result = await dashboardService.getMyAssessmentsService(token: "test_token");

      expect(result, isA<AssessmentsModel>());
      verify(mockHttpClient.get(any, headers: anyNamed("headers"))).called(1);
    });

    test("getMyAssessmentsService() should throw an error if response is not 200", () async {
      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response("Error", 400),
      );

      expect(() async => await dashboardService.getMyAssessmentsService(token: "test_token"), throwsException);
    });

    ///   Test for getAllAssessmentsService()
    test("getAllAssessmentsService() should return all assessments data", () async {
      final mockResponse = '''
      {
    "total": 31,
    "limit": 20,
    "skip": 0,
    "page": 1,
    "data": [
        {
            "_id": "67b43b10c56e33f54d503bdc",
            "created_at": "2025-02-18T07:47:28.633Z",
            "level_category": "all",
            "number": 1,
            "name": "Python for assessment",
            "rating": null,
            "reviews_count": 0,
            "total_batches": 0,
            "total_students": 3,
            "instructors": []
        }
    ]
}
      ''';

      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response(mockResponse, 200),
      );

      final result = await dashboardService.getAllAssessmentsService(token: "test_token");

      expect(result, isA<AllAssessmentsModel>());
      verify(mockHttpClient.get(any, headers: anyNamed("headers"))).called(1);
    });

    test("getAllAssessmentsService() should throw an error if response is not 200", () async {
      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response("Error", 400),
      );

      expect(() async => await dashboardService.getAllAssessmentsService(token: "test_token"), throwsException);
    });

    /// Test for checkBlocked()
    test("checkBlocked() should return 200 if course is not blocked", () async {
      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response("", 200),
      );

      final result = await dashboardService.checkBlocked("test_token", "course123");

      expect(result, 200);
      verify(mockHttpClient.get(any, headers: anyNamed("headers"))).called(1);
    });

    test("checkBlocked() should return 400 if course is blocked", () async {
      when(mockHttpClient.get(any, headers: anyNamed("headers"))).thenAnswer(
        (_) async => http.Response("", 400),
      );

      final result = await dashboardService.checkBlocked("test_token", "course123");

      expect(result, 400);
    });
  });*/
}
