import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LoginPageWidget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) => HomeWidget(
            startingChip: params.getParam('startingChip', ParamType.String),
            startingCategory:
                params.getParam('startingCategory', ParamType.String),
            isNew: params.getParam('isNew', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'categoriesgallery',
          path: '/digitalresourcehub',
          builder: (context, params) => CategoriesgalleryWidget(),
        ),
        FFRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'map',
          path: '/map',
          asyncParams: {
            'locationtoLoad':
                getDoc(['locations'], LocationsRecord.fromSnapshot),
          },
          builder: (context, params) => MapWidget(
            locationtoLoad:
                params.getParam('locationtoLoad', ParamType.Document),
            isLoadPrograms: params.getParam('isLoadPrograms', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'refugeepalwelcomescreen',
          path: '/refugeepalwelcomescreen',
          builder: (context, params) => RefugeepalwelcomescreenWidget(),
        ),
        FFRoute(
          name: 'connect',
          path: '/connect',
          requireAuth: true,
          asyncParams: {
            'chatToLoad': getDoc(['chats'], ChatsRecord.fromSnapshot),
            'messagesToLoad':
                getDocList(['chats', 'messages'], MessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ConnectWidget(
            chatToLoad: params.getParam('chatToLoad', ParamType.Document),
            messagesToLoad: params.getParam<MessagesRecord>(
                'messagesToLoad', ParamType.Document, true),
            professionToLoad:
                params.getParam('professionToLoad', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'loginPage',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'category',
          path: '/category',
          builder: (context, params) => CategoryWidget(
            catrgorydetailed: params.getParam('catrgorydetailed',
                ParamType.DocumentReference, false, ['category']),
          ),
        ),
        FFRoute(
          name: 'subcategory',
          path: '/subcategory',
          builder: (context, params) => SubcategoryWidget(
            subcategorydetail: params.getParam('subcategorydetail',
                ParamType.DocumentReference, false, ['subcategory']),
          ),
        ),
        FFRoute(
          name: 'userjourney',
          path: '/userjourney',
          builder: (context, params) => UserjourneyWidget(),
        ),
        FFRoute(
          name: 'settingsProfile',
          path: '/settingsProfile',
          builder: (context, params) => SettingsProfileWidget(),
        ),
        FFRoute(
          name: 'settingsAccInfo',
          path: '/settingsProfileCopy',
          builder: (context, params) => SettingsAccInfoWidget(),
        ),
        FFRoute(
          name: 'settingsNotifs',
          path: '/settingsNotifs',
          builder: (context, params) => SettingsNotifsWidget(),
        ),
        FFRoute(
          name: 'settingsAccInfoCopy',
          path: '/settingsProfileCopy2',
          builder: (context, params) => SettingsAccInfoCopyWidget(),
        ),
        FFRoute(
          name: 'userjourneyHelper',
          path: '/userjourneyHelper',
          builder: (context, params) => UserjourneyHelperWidget(),
        ),
        FFRoute(
          name: 'helperEdit',
          path: '/helperEdit',
          asyncParams: {
            'rpToEdit': getDoc(
                ['resourceprovider'], ResourceproviderRecord.fromSnapshot),
            'subcategoryToEdit':
                getDoc(['subcategory'], SubcategoryRecord.fromSnapshot),
          },
          builder: (context, params) => HelperEditWidget(
            rpToEdit: params.getParam('rpToEdit', ParamType.Document),
            subcategoryToEdit:
                params.getParam('subcategoryToEdit', ParamType.Document),
            indexInList: params.getParam('indexInList', ParamType.int),
            isEditSubcategory:
                params.getParam('isEditSubcategory', ParamType.bool),
            editOrganizationRP:
                params.getParam('editOrganizationRP', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'helperOrganization',
          path: '/helperOrganization',
          asyncParams: {
            'locationToEdit':
                getDoc(['locations'], LocationsRecord.fromSnapshot),
            'programToEdit':
                getDoc(['locations', 'programs'], ProgramsRecord.fromSnapshot),
          },
          builder: (context, params) => HelperOrganizationWidget(
            locationToEdit:
                params.getParam('locationToEdit', ParamType.Document),
            editing: params.getParam('editing', ParamType.String),
            itemInList: params.getParam('itemInList', ParamType.int),
            programToEdit: params.getParam('programToEdit', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'helperChat',
          path: '/helperChat',
          asyncParams: {
            'chatToLoad': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => HelperChatWidget(
            chatToLoad: params.getParam('chatToLoad', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PhoneCode',
          path: '/phoneCode',
          builder: (context, params) => PhoneCodeWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.int),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 500),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
