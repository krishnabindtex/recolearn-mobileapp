// Mocks generated by Mockito 5.4.5 from annotations
// in recolearn_mobile/test/recolearn_dashboard/login_case/login_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i9;

import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:recolearn_mobile/controllers/auth/cache_manager.dart' as _i7;
import 'package:recolearn_mobile/models/auth/login_model/login_response_model.dart'
    as _i3;
import 'package:recolearn_mobile/services/auth/login_service.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGetHttpClient_1 extends _i1.SmartFake implements _i2.GetHttpClient {
  _FakeGetHttpClient_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeInternalFinalCallback_2<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResponse_3<T1> extends _i1.SmartFake implements _i2.Response<T1> {
  _FakeResponse_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGetSocket_4 extends _i1.SmartFake implements _i2.GetSocket {
  _FakeGetSocket_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGraphQLResponse_5<T1> extends _i1.SmartFake
    implements _i2.GraphQLResponse<T1> {
  _FakeGraphQLResponse_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeRxBool_6 extends _i1.SmartFake implements _i2.RxBool {
  _FakeRxBool_6(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeLoginResponseModel_7 extends _i1.SmartFake
    implements _i3.LoginResponseModel {
  _FakeLoginResponseModel_7(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [LoginService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginService extends _i1.Mock implements _i4.LoginService {
  MockLoginService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get allowAutoSignedCert =>
      (super.noSuchMethod(
            Invocation.getter(#allowAutoSignedCert),
            returnValue: false,
          )
          as bool);

  @override
  set allowAutoSignedCert(bool? _allowAutoSignedCert) => super.noSuchMethod(
    Invocation.setter(#allowAutoSignedCert, _allowAutoSignedCert),
    returnValueForMissingStub: null,
  );

  @override
  String get userAgent =>
      (super.noSuchMethod(
            Invocation.getter(#userAgent),
            returnValue: _i5.dummyValue<String>(
              this,
              Invocation.getter(#userAgent),
            ),
          )
          as String);

  @override
  set userAgent(String? _userAgent) => super.noSuchMethod(
    Invocation.setter(#userAgent, _userAgent),
    returnValueForMissingStub: null,
  );

  @override
  bool get sendUserAgent =>
      (super.noSuchMethod(Invocation.getter(#sendUserAgent), returnValue: false)
          as bool);

  @override
  set sendUserAgent(bool? _sendUserAgent) => super.noSuchMethod(
    Invocation.setter(#sendUserAgent, _sendUserAgent),
    returnValueForMissingStub: null,
  );

  @override
  set baseUrl(String? _baseUrl) => super.noSuchMethod(
    Invocation.setter(#baseUrl, _baseUrl),
    returnValueForMissingStub: null,
  );

  @override
  String get defaultContentType =>
      (super.noSuchMethod(
            Invocation.getter(#defaultContentType),
            returnValue: _i5.dummyValue<String>(
              this,
              Invocation.getter(#defaultContentType),
            ),
          )
          as String);

  @override
  set defaultContentType(String? _defaultContentType) => super.noSuchMethod(
    Invocation.setter(#defaultContentType, _defaultContentType),
    returnValueForMissingStub: null,
  );

  @override
  bool get followRedirects =>
      (super.noSuchMethod(
            Invocation.getter(#followRedirects),
            returnValue: false,
          )
          as bool);

  @override
  set followRedirects(bool? _followRedirects) => super.noSuchMethod(
    Invocation.setter(#followRedirects, _followRedirects),
    returnValueForMissingStub: null,
  );

  @override
  int get maxRedirects =>
      (super.noSuchMethod(Invocation.getter(#maxRedirects), returnValue: 0)
          as int);

  @override
  set maxRedirects(int? _maxRedirects) => super.noSuchMethod(
    Invocation.setter(#maxRedirects, _maxRedirects),
    returnValueForMissingStub: null,
  );

  @override
  int get maxAuthRetries =>
      (super.noSuchMethod(Invocation.getter(#maxAuthRetries), returnValue: 0)
          as int);

  @override
  set maxAuthRetries(int? _maxAuthRetries) => super.noSuchMethod(
    Invocation.setter(#maxAuthRetries, _maxAuthRetries),
    returnValueForMissingStub: null,
  );

  @override
  set defaultDecoder(_i2.Decoder<dynamic>? _defaultDecoder) =>
      super.noSuchMethod(
        Invocation.setter(#defaultDecoder, _defaultDecoder),
        returnValueForMissingStub: null,
      );

  @override
  Duration get timeout =>
      (super.noSuchMethod(
            Invocation.getter(#timeout),
            returnValue: _FakeDuration_0(this, Invocation.getter(#timeout)),
          )
          as Duration);

  @override
  set timeout(Duration? _timeout) => super.noSuchMethod(
    Invocation.setter(#timeout, _timeout),
    returnValueForMissingStub: null,
  );

  @override
  set trustedCertificates(List<_i2.TrustedCertificate>? _trustedCertificates) =>
      super.noSuchMethod(
        Invocation.setter(#trustedCertificates, _trustedCertificates),
        returnValueForMissingStub: null,
      );

  @override
  set findProxy(String Function(Uri)? _findProxy) => super.noSuchMethod(
    Invocation.setter(#findProxy, _findProxy),
    returnValueForMissingStub: null,
  );

  @override
  bool get withCredentials =>
      (super.noSuchMethod(
            Invocation.getter(#withCredentials),
            returnValue: false,
          )
          as bool);

  @override
  set withCredentials(bool? _withCredentials) => super.noSuchMethod(
    Invocation.setter(#withCredentials, _withCredentials),
    returnValueForMissingStub: null,
  );

  @override
  List<_i2.GetSocket> get sockets =>
      (super.noSuchMethod(
            Invocation.getter(#sockets),
            returnValue: <_i2.GetSocket>[],
          )
          as List<_i2.GetSocket>);

  @override
  _i2.GetHttpClient get httpClient =>
      (super.noSuchMethod(
            Invocation.getter(#httpClient),
            returnValue: _FakeGetHttpClient_1(
              this,
              Invocation.getter(#httpClient),
            ),
          )
          as _i2.GetHttpClient);

  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);

  @override
  set sockets(List<_i2.GetSocket>? _sockets) => super.noSuchMethod(
    Invocation.setter(#sockets, _sockets),
    returnValueForMissingStub: null,
  );

  @override
  _i2.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(
            Invocation.getter(#onStart),
            returnValue: _FakeInternalFinalCallback_2<void>(
              this,
              Invocation.getter(#onStart),
            ),
          )
          as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(
            Invocation.getter(#onDelete),
            returnValue: _FakeInternalFinalCallback_2<void>(
              this,
              Invocation.getter(#onDelete),
            ),
          )
          as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  _i6.Future<dynamic> fetchLogin(dynamic data) =>
      (super.noSuchMethod(
            Invocation.method(#fetchLogin, [data]),
            returnValue: _i6.Future<dynamic>.value(),
          )
          as _i6.Future<dynamic>);

  @override
  _i6.Future<_i2.Response<T>> get<T>(
    String? url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #get,
              [url],
              {
                #headers: headers,
                #contentType: contentType,
                #query: query,
                #decoder: decoder,
              },
            ),
            returnValue: _i6.Future<_i2.Response<T>>.value(
              _FakeResponse_3<T>(
                this,
                Invocation.method(
                  #get,
                  [url],
                  {
                    #headers: headers,
                    #contentType: contentType,
                    #query: query,
                    #decoder: decoder,
                  },
                ),
              ),
            ),
          )
          as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #post,
              [url, body],
              {
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress,
              },
            ),
            returnValue: _i6.Future<_i2.Response<T>>.value(
              _FakeResponse_3<T>(
                this,
                Invocation.method(
                  #post,
                  [url, body],
                  {
                    #contentType: contentType,
                    #headers: headers,
                    #query: query,
                    #decoder: decoder,
                    #uploadProgress: uploadProgress,
                  },
                ),
              ),
            ),
          )
          as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> put<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #put,
              [url, body],
              {
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress,
              },
            ),
            returnValue: _i6.Future<_i2.Response<T>>.value(
              _FakeResponse_3<T>(
                this,
                Invocation.method(
                  #put,
                  [url, body],
                  {
                    #contentType: contentType,
                    #headers: headers,
                    #query: query,
                    #decoder: decoder,
                    #uploadProgress: uploadProgress,
                  },
                ),
              ),
            ),
          )
          as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> patch<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #patch,
              [url, body],
              {
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress,
              },
            ),
            returnValue: _i6.Future<_i2.Response<T>>.value(
              _FakeResponse_3<T>(
                this,
                Invocation.method(
                  #patch,
                  [url, body],
                  {
                    #contentType: contentType,
                    #headers: headers,
                    #query: query,
                    #decoder: decoder,
                    #uploadProgress: uploadProgress,
                  },
                ),
              ),
            ),
          )
          as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> request<T>(
    String? url,
    String? method, {
    dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
    _i2.Progress? uploadProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #request,
              [url, method],
              {
                #body: body,
                #contentType: contentType,
                #headers: headers,
                #query: query,
                #decoder: decoder,
                #uploadProgress: uploadProgress,
              },
            ),
            returnValue: _i6.Future<_i2.Response<T>>.value(
              _FakeResponse_3<T>(
                this,
                Invocation.method(
                  #request,
                  [url, method],
                  {
                    #body: body,
                    #contentType: contentType,
                    #headers: headers,
                    #query: query,
                    #decoder: decoder,
                    #uploadProgress: uploadProgress,
                  },
                ),
              ),
            ),
          )
          as _i6.Future<_i2.Response<T>>);

  @override
  _i6.Future<_i2.Response<T>> delete<T>(
    String? url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    _i2.Decoder<T>? decoder,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #delete,
              [url],
              {
                #headers: headers,
                #contentType: contentType,
                #query: query,
                #decoder: decoder,
              },
            ),
            returnValue: _i6.Future<_i2.Response<T>>.value(
              _FakeResponse_3<T>(
                this,
                Invocation.method(
                  #delete,
                  [url],
                  {
                    #headers: headers,
                    #contentType: contentType,
                    #query: query,
                    #decoder: decoder,
                  },
                ),
              ),
            ),
          )
          as _i6.Future<_i2.Response<T>>);

  @override
  _i2.GetSocket socket(
    String? url, {
    Duration? ping = const Duration(seconds: 5),
  }) =>
      (super.noSuchMethod(
            Invocation.method(#socket, [url], {#ping: ping}),
            returnValue: _FakeGetSocket_4(
              this,
              Invocation.method(#socket, [url], {#ping: ping}),
            ),
          )
          as _i2.GetSocket);

  @override
  _i6.Future<_i2.GraphQLResponse<T>> query<T>(
    String? query, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #query,
              [query],
              {#url: url, #variables: variables, #headers: headers},
            ),
            returnValue: _i6.Future<_i2.GraphQLResponse<T>>.value(
              _FakeGraphQLResponse_5<T>(
                this,
                Invocation.method(
                  #query,
                  [query],
                  {#url: url, #variables: variables, #headers: headers},
                ),
              ),
            ),
          )
          as _i6.Future<_i2.GraphQLResponse<T>>);

  @override
  _i6.Future<_i2.GraphQLResponse<T>> mutation<T>(
    String? mutation, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #mutation,
              [mutation],
              {#url: url, #variables: variables, #headers: headers},
            ),
            returnValue: _i6.Future<_i2.GraphQLResponse<T>>.value(
              _FakeGraphQLResponse_5<T>(
                this,
                Invocation.method(
                  #mutation,
                  [mutation],
                  {#url: url, #variables: variables, #headers: headers},
                ),
              ),
            ),
          )
          as _i6.Future<_i2.GraphQLResponse<T>>);

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  void onInit() => super.noSuchMethod(
    Invocation.method(#onInit, []),
    returnValueForMissingStub: null,
  );

  @override
  void onReady() => super.noSuchMethod(
    Invocation.method(#onReady, []),
    returnValueForMissingStub: null,
  );

  @override
  void onClose() => super.noSuchMethod(
    Invocation.method(#onClose, []),
    returnValueForMissingStub: null,
  );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
    Invocation.method(#$configureLifeCycle, []),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [AuthenticationManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationManager extends _i1.Mock
    implements _i7.AuthenticationManager {
  MockAuthenticationManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RxBool get isLogged =>
      (super.noSuchMethod(
            Invocation.getter(#isLogged),
            returnValue: _FakeRxBool_6(this, Invocation.getter(#isLogged)),
          )
          as _i2.RxBool);

  @override
  _i2.InternalFinalCallback<void> get onStart =>
      (super.noSuchMethod(
            Invocation.getter(#onStart),
            returnValue: _FakeInternalFinalCallback_2<void>(
              this,
              Invocation.getter(#onStart),
            ),
          )
          as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete =>
      (super.noSuchMethod(
            Invocation.getter(#onDelete),
            returnValue: _FakeInternalFinalCallback_2<void>(
              this,
              Invocation.getter(#onDelete),
            ),
          )
          as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized =>
      (super.noSuchMethod(Invocation.getter(#initialized), returnValue: false)
          as bool);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);

  @override
  int get listeners =>
      (super.noSuchMethod(Invocation.getter(#listeners), returnValue: 0)
          as int);

  @override
  void logOut() => super.noSuchMethod(
    Invocation.method(#logOut, []),
    returnValueForMissingStub: null,
  );

  @override
  void login(_i3.LoginResponseModel? loginResponseModel) => super.noSuchMethod(
    Invocation.method(#login, [loginResponseModel]),
    returnValueForMissingStub: null,
  );

  @override
  void checkLoginStatus() => super.noSuchMethod(
    Invocation.method(#checkLoginStatus, []),
    returnValueForMissingStub: null,
  );

  @override
  void update([List<Object>? ids, bool? condition = true]) =>
      super.noSuchMethod(
        Invocation.method(#update, [ids, condition]),
        returnValueForMissingStub: null,
      );

  @override
  void onInit() => super.noSuchMethod(
    Invocation.method(#onInit, []),
    returnValueForMissingStub: null,
  );

  @override
  void onReady() => super.noSuchMethod(
    Invocation.method(#onReady, []),
    returnValueForMissingStub: null,
  );

  @override
  void onClose() => super.noSuchMethod(
    Invocation.method(#onClose, []),
    returnValueForMissingStub: null,
  );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
    Invocation.method(#$configureLifeCycle, []),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Disposer addListener(_i8.GetStateUpdate? listener) =>
      (super.noSuchMethod(
            Invocation.method(#addListener, [listener]),
            returnValue: () {},
          )
          as _i8.Disposer);

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
    Invocation.method(#removeListener, [listener]),
    returnValueForMissingStub: null,
  );

  @override
  void refresh() => super.noSuchMethod(
    Invocation.method(#refresh, []),
    returnValueForMissingStub: null,
  );

  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
    Invocation.method(#refreshGroup, [id]),
    returnValueForMissingStub: null,
  );

  @override
  void notifyChildrens() => super.noSuchMethod(
    Invocation.method(#notifyChildrens, []),
    returnValueForMissingStub: null,
  );

  @override
  void removeListenerId(Object? id, _i9.VoidCallback? listener) =>
      super.noSuchMethod(
        Invocation.method(#removeListenerId, [id, listener]),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  _i8.Disposer addListenerId(Object? key, _i8.GetStateUpdate? listener) =>
      (super.noSuchMethod(
            Invocation.method(#addListenerId, [key, listener]),
            returnValue: () {},
          )
          as _i8.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
    Invocation.method(#disposeId, [id]),
    returnValueForMissingStub: null,
  );

  @override
  _i6.Future<bool> saveData(_i3.LoginResponseModel? loginResponseModel) =>
      (super.noSuchMethod(
            Invocation.method(#saveData, [loginResponseModel]),
            returnValue: _i6.Future<bool>.value(false),
          )
          as _i6.Future<bool>);

  @override
  _i3.LoginResponseModel getData() =>
      (super.noSuchMethod(
            Invocation.method(#getData, []),
            returnValue: _FakeLoginResponseModel_7(
              this,
              Invocation.method(#getData, []),
            ),
          )
          as _i3.LoginResponseModel);

  @override
  _i6.Future<void> removeData() =>
      (super.noSuchMethod(
            Invocation.method(#removeData, []),
            returnValue: _i6.Future<void>.value(),
            returnValueForMissingStub: _i6.Future<void>.value(),
          )
          as _i6.Future<void>);

  @override
  _i6.Future<void> removeToken() =>
      (super.noSuchMethod(
            Invocation.method(#removeToken, []),
            returnValue: _i6.Future<void>.value(),
            returnValueForMissingStub: _i6.Future<void>.value(),
          )
          as _i6.Future<void>);
}
