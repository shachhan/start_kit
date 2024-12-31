import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:start_kit01/provider/userProvider.dart';
import 'package:start_kit01/router/appRouter.dart';
import 'package:start_kit01/service/appService.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppService appService;
  @override
  void initState() {
    appService = AppService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppService>(create: (_) => appService,),
        Provider<AppRouter>(create: (_) => AppRouter(appService),),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider(),),
      ],
      child: Builder(
        builder: (context) {
          final goRouter = context.read<AppRouter>().router;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Start Kit 01',
            theme: ThemeData.light(),
            routerConfig: goRouter,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              );
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ko'),],
          );
        }
      ),
    );
  }
}