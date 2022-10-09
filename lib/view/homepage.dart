import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/character_tile.dart';
import '../controller/charcater_controller.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BreakingBadCharacterController>(
          init: BreakingBadCharacterController(),
          builder: (controller) {
            return controller.isLoading.value
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.charcaters.length,
                    itemBuilder: (context, index) {
                      var breakingBadcharcater = controller.charcaters[index];
                      return CharacterTile(character: breakingBadcharcater);
                    },
                  )
                : const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

