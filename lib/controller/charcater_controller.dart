import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../constants.dart';
import '../model/character_model.dart';

class BreakingBadCharacterController extends GetxController {
  var isLoading = false.obs;
  List<BreakingBadModel> charcaters = [];

  Future<void> fetchCharacter() async {
    isLoading.value = false;
    update();
    var response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      charcaters = List.from(decodedData)
          .map((e) => BreakingBadModel.fromMap(e))
          .toList();
      isLoading.value = true;
      update();
    }
  }

  BreakingBadCharacterController() {
    fetchCharacter();
  }
}
