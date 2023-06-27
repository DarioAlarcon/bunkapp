import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRivecontroller(Artboard artboard,
      {stateMachineName = "state machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);

    return controller;
  }

  
}