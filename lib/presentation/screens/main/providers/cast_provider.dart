import 'package:flutter/material.dart';
import 'package:movies_app/config/helpers/cast_helper.dart';

import '../../../../infrastructure/models/cast_model.dart';

class CastProvider extends ChangeNotifier {
  final CastHelper castHelper = CastHelper();
  final castPeople = <Cast>[];

  Future<void> getCast(int id) async {
    castPeople.clear();
    final aux = await castHelper.getCast(id);
    castPeople.addAll(aux);
    notifyListeners();
  }
}
