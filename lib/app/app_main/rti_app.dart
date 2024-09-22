import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_theme/app_theme_provider.dart';
import '../data/app_constant.dart';
import '../module/splash_screen/splash_screen.dart';
import '../screen_routes/my_route_observer.dart';
import '../screen_routes/screen_routes.dart';


class RtiApp extends StatefulWidget {
  const RtiApp({super.key});

  @override
  State<RtiApp> createState() => _RtiAppState();
}

class _RtiAppState extends State<RtiApp> {
  @override
  void initState() {
    super.initState();
  }

  static Map<String, WidgetBuilder> appRoutes = ScreenRoutes.appRoutes;

  // This function generates routes with custom animations
  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    final WidgetBuilder? builder = appRoutes[settings.name];
    if (builder != null) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Define custom transition (Slide + Fade)
          const begin = Offset(1.0, 0.0); // Slide in from right
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      );
    }
    // Default to a MaterialPageRoute if no custom route is found
    // Handle unknown routes with a custom screen
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: const Center(child: Text('404 - Page Not Found')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (_, provider, child) {
        applicationContext = context;

        final ThemeData theme = provider.themeData;
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'RTI APP',
          debugShowCheckedModeBanner: false,
          theme: theme,
          // Set a custom NavigatorObserver to track route transitions
          navigatorObservers: [MyRouteObserver()],
          // routes: ScreenRoutes.appRoutes,
          onGenerateRoute: _onGenerateRoute,
          home: const SplashScreen(),
          initialRoute: "/splashScreen",
          builder: (BuildContext context, Widget? child) {
            return Builder(
              builder: (BuildContext context) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: MediaQuery.of(context).size.width > 360
                        ? 1.0
                        : MediaQuery.of(context).size.width >= 340
                            ? 0.9
                            : 0.8,
                  ),
                  child: child ?? const SizedBox(),
                );
              },
            );
          },
        );
      },
    );
  }
}
