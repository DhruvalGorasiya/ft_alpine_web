import 'package:ft_chetak_books/module/authentication/login/login_screen.dart';
import 'package:ft_chetak_books/module/tab/tab_screen.dart';
import 'package:ft_chetak_books/package/config_packages.dart';




class AlpineApp extends StatefulWidget {
  const AlpineApp({super.key});

  @override
  State<AlpineApp> createState() => _AlpineAppState();
}

class _AlpineAppState extends State<AlpineApp> with WidgetsBindingObserver {
  var locales = [
    const Locale('en', ''),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> dioSetup() async {
    proxy = Responsive.isDesktop(context) ? "https://cors-anywhere.herokuapp.com/" : "";
    await dioSetUp();
  }

  @override
  Widget build(BuildContext context) {
    dioSetup();
    return GetMaterialApp(
      title: 'AlpineApp',
      debugShowCheckedModeBanner: false,
      themeMode: AppPref().isDark == null ? ThemeMode.system : (AppPref().isDark! ? ThemeMode.dark : ThemeMode.light),
      locale: const Locale('en', ''),
      supportedLocales: locales,
      scrollBehavior: CustomScrollBehavior(),

       home:  AppPref().token.isEmpty?const LogInScreen():const TabBarScreen(),

      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: (MediaQuery.of(context).platformBrightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark),
          child: child ?? Container(),
        );
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}