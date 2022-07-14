import 'package:errandoay_onboarding/features/onboarding/presentation/pages/account_created.dart';
import 'package:errandoay_onboarding/features/onboarding/presentation/pages/create_account.dart';
import 'package:errandoay_onboarding/features/onboarding/presentation/pages/get_started_page.dart';
import 'package:errandoay_onboarding/features/onboarding/presentation/pages/verification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Circular'
      ),
      initialRoute: GetStartedPage.id,
      routes: {
        GetStartedPage.id : (context) => const GetStartedPage(),
        CreateAccount.id : (context) => const CreateAccount(),
        VerificationPage.id : (context) => const VerificationPage(),
        AccountCreated.id : (context) => const AccountCreated(),
      },
    );
  }
}
