import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ministerio_de_salud/pages/widgets/group/m_loading.dart';

import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:ministerio_de_salud/utils/navigator_route.dart';

// void navigatorPushReplacement(BuildContext context, Widget route) {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute<void>(
//       builder: (BuildContext context) => route,
//     ),
//   );
// }

void navigatorPushReplacementWithDelay(BuildContext context, Widget route,
    {int seconds = 2}) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
        transitionDuration: Duration(seconds: seconds),
        pageBuilder: (_, __, ___) => route),
  );
}

void navigatorPush(BuildContext context, Widget route) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => route,
    ),
  );
}

void snackBarMessageError(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.red,
      content: Text(text),
    ),
  );
}

// void changeColorNavigator() {
//   if (Platform.isAndroid) {
//     print('Plataform is ANDROID');
//     // SystemChrome.setSystemUIOverlayStyle(
//     //   const SystemUiOverlayStyle(
//     //       systemNavigationBarColor: Color.fromRGBO(15, 127, 141, 1.0),
//     //       systemNavigationBarIconBrightness: Brightness.light),
//     // );
//     SystemUiOverlayStyle mySystemTheme = SystemUiOverlayStyle.light
//         .copyWith(systemNavigationBarColor: secondaryColor);
//     SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
//   }
// }

Future<void> progresLoading(
    BuildContext context, Future asyncFunction, Widget redirectPage) async {
  bool isComplete = false;
  showDialog(
    context: context,
    builder: (ctx) => const MLoading(),
  ).whenComplete(() => isComplete = true);

  await asyncFunction.then(
    (value) {
      if (!isComplete) {
        Navigator.pop(context);
      }
      if (value != null) {
        if (value.toString() == 'true') {
          navigatorPushReplacement(context, redirectPage);
        } else {
          snackBarMessageError(context, value.toString());
        }
      } else {
        snackBarMessageError(context, 'valor no esperado corrigelo');
      }
    },
  ).onError((error, stackTrace) {
    if (!isComplete) {
      Navigator.pop(context);
    }
    snackBarMessageError(context, '$error');
    return null;
  });
}

Future<void> progresLoadingAction(
    BuildContext context, Future asyncFunction, Function action) async {
  bool isComplete = false;
  showDialog(
    context: context,
    builder: (ctx) => const MLoading(),
  ).whenComplete(() => isComplete = true);

  await asyncFunction.then(
    (value) {
      if (!isComplete) {
        Navigator.pop(context);
      }
      if (value != null) {
        if (value.toString() == 'true') {
          action();
        } else {
          snackBarMessageError(context, value.toString());
        }
      } else {
        snackBarMessageError(context, 'valor no esperado corrigelo');
      }
    },
  ).onError((error, stackTrace) {
    if (!isComplete) {
      Navigator.pop(context);
    }
    snackBarMessageError(context, '$error');
    return null;
  });
}

Widget buttonPlus({required Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.grey.shade100,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey.shade200),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.add),
        ),
      ),
    ),
  );
}

String encryptMD5(String input) {
  var bytes = utf8.encode(input);
  var digest = md5.convert(bytes);
  return digest.toString();
}
