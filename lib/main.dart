import 'package:adaptive_screen_flutter/adaptive_screen_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tyrbine_website/l10n/app_localizations.dart';
import 'package:tyrbine_website/presentation/screens/home_mob_screen.dart';
import 'package:tyrbine_website/presentation/screens/home_web_screen.dart';
import 'package:tyrbine_website/presentation/screens/stat_screen.dart';
import 'package:tyrbine_website/theme/theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:tyrbine_website/widgets/no_thumb_scroll_behavior.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          final String? address = state.uri.queryParameters['vault'];
          return NoTransitionPage(
          child: AdaptiveScreen(
            mobile: HomeMobScreen(vaultMint: address ?? 'So11111111111111111111111111111111111111112'),
            web: HomeWebScreen(vaultMint: address ?? 'So11111111111111111111111111111111111111112'),
          ),
        );
        },
      ),
      GoRoute(
        path: '/stat',
        pageBuilder: (context, state) {
          return NoTransitionPage(
          child: AdaptiveScreen(
            mobile: StatScreen(),
            web: StatScreen(),
          ),
        );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
          body: Center(
            child: Text('404',
                style: TextStyle(
                    fontSize: 42.0, color: Theme.of(context).hintColor)),
          ),
        ));

void main() async {
  usePathUrlStrategy();
  
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            // Locale('ru'),
            // Locale('hi'),
            // Locale('tr'),
            // Locale('ar'),
          ],
          title: 'Tyrbine',
          scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          routerConfig: _router,
        ),
      ),
  );
}
