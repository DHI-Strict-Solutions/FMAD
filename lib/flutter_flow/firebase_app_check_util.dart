import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6LdGsh4qAAAAAOWOy_7MHWNkOKQmBlpsFhuUvWhH'),
      androidProvider: AndroidProvider.playIntegrity,
    );
