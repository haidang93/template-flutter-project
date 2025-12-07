import 'package:flutter/material.dart';
import 'package:template/app/common/config/env.dart';
import 'package:template/app/providers/app_provider.dart';
import 'package:template/app/providers/repository_provider.dart';
import 'package:template/l10n/generated/app_localizations.dart';
import 'package:template/l10n/l10n.dart';
import 'package:template/l10n/l10n_wrapper.dart';
import 'package:template/routes/routes.uloc.g.dart';
import 'package:uloc/uloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppProvider(context)),
      ],
      child: const InnerApp(),
    );
  }
}

class InnerApp extends StatelessWidget {
  const InnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return L10nWrapper(
      builder: (locale) => MultiProvider(
        providers: [
          Provider(
            create: (context) =>
                RepositoryProvider(endpoint, L10nEnum.parse(locale)),
          ),
          // Provider(create: (context) => PushNotificationsProvider(context)),
          // Provider(create: (context) => DeeplinkProvider(context)),
        ],
        child: buildMaterialApp(context, locale),
      ),
    );
  }
}

Widget buildMaterialApp(BuildContext context, Locale locale) {
  return MaterialApp(
    navigatorKey: context.read<AppProvider>().navigationKey,
    title: 'Example',
    debugShowCheckedModeBanner: false,
    locale: locale,
    initialRoute: Routes.HOME.name,
    onGenerateRoute: Routes.ulocRouteConfiguration.routeBuilder,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
  );
}
