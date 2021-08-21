import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work/pages/home_page.dart';
import 'package:work/pages/onboarding_page.dart';
import 'package:work/pages/sign_in_page.dart';
import 'package:work/pages/sign_up_page.dart';
import 'package:work/pages/splash_page.dart';
import 'package:work/providers/auth_provider.dart';
import 'package:work/providers/hot_category_provider.dart';
import 'package:work/providers/job_provider.dart';
import 'package:work/providers/user_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<HotCategoryJobProvider>(
            create: (context) => HotCategoryJobProvider()),
        ChangeNotifierProvider<JobProvider>(create: (context) => JobProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
