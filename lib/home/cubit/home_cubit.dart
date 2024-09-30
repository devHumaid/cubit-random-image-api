import 'dart:convert';

import 'package:api/apimodel.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.context) : super(HomeInitial()) {
    fetchImage();
  }
  BuildContext context;
  Future fetchImage() async {
    final url = "https://dog.ceo/api/breeds/image/random";
    final uri = Uri.parse(url);
    final respnse = await http.get(uri);

    if (respnse.statusCode == 200) {
      print(respnse.body);
      final res = jsonDecode(respnse.body);
      final data = ApiModel.fromJson(res);
      emit(DogState(data: data));
    } else {
      print("error");
    }
  }
}
