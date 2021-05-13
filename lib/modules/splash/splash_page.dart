import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app_pages.dart';
import '/util/constants/locale_keys.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    fetchSomething();
  }

  void fetchSomething() async {
    //TODO Call API from server and do sth
    await new Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.hello.tr));
  }
}
