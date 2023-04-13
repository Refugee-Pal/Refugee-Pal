import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();

  await FlutterFlowTheme.initialize();
  await FFLocalizations.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<RefugeePalFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = refugeePalFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RefugeePal',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('fa'),
        Locale('uk'),
        Locale('hy'),
        Locale('fr'),
        Locale('fj'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale('tr'),
        Locale('my'),
        Locale('ps'),
        Locale('es'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'home': HomeWidget(),
      'categoriesgallery': CategoriesgalleryWidget(),
      'interactivemap': InteractivemapWidget(),
      'connecthealthcare': ConnecthealthcareWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Color(0xFF4CA4BF),
        color: Color(0x8AFFFFFF),
        activeColor: Colors.white,
        tabBackgroundColor: Color(0x00000000),
        tabBorderRadius: 20.0,
        tabMargin: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        gap: 10.0,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        duration: Duration(milliseconds: 500),
        haptic: true,
        tabs: [
          GButton(
            icon: FontAwesomeIcons.solidCompass,
            text: FFLocalizations.of(context).getText(
              'dis6alpz' /* Explore */,
            ),
            iconSize: 35.0,
          ),
          GButton(
            icon: FontAwesomeIcons.book,
            text: FFLocalizations.of(context).getText(
              'u0rslaeu' /* Content */,
            ),
            iconSize: 30.0,
            backgroundColor: Color(0xC74CA4BF),
          ),
          GButton(
            icon: FontAwesomeIcons.mapMarkedAlt,
            text: FFLocalizations.of(context).getText(
              'g0sds11o' /* Map */,
            ),
            iconSize: 30.0,
          ),
          GButton(
            icon: FontAwesomeIcons.userTie,
            text: FFLocalizations.of(context).getText(
              's471wtha' /* Connect */,
            ),
            iconSize: 30.0,
          )
        ],
      ),
    );
  }
}
