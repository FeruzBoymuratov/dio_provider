import 'dart:math';

import 'package:dio_provider/models/post_model.dart';
import 'package:dio_provider/pages/home_page.dart';
import 'package:dio_provider/services/dio_service.dart';
import 'package:flutter/cupertino.dart';

class CreateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  Future apiPostCreate(BuildContext context, String title, String body) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.POST(
        Network.BASE + Network.API_CREATE,
        Network.paramsCreate(
            Post(
                userId: Random().nextInt(30),
                id: Random().nextInt(30),
                title: title,
                body: body
            )
        )
    );

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
      // return response;
    }

    isLoading = false;
    notifyListeners();
  }
}