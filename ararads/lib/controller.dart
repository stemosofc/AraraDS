import 'dart:async';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gamepads/gamepads.dart';

class JoystickGame extends FlameGame {
  late final StreamSubscription<GamepadEvent> _gamepadSubscription;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Inicializa a escuta de eventos do gamepad
    _gamepadSubscription = Gamepads.events.listen(_onGamepadEvent);
    if(kDebugMode){
      debugPrint("Escutando eventos do gamepad.");
    }
  }

  void _onGamepadEvent(GamepadEvent event) {
    switch (event.type) {
      case KeyType.button:
        if (event.value == 1.0) {
          if(kDebugMode){
           debugPrint("Botão pressionado: ${event.key}");
          }
          // Lógica para quando o botão é pressionado
        } else {
          if(kDebugMode){
            debugPrint("Botão liberado: ${event.key}");
          }
          // Lógica para quando o botão é liberado
        }
        break;
      case KeyType.analog:
        if(kDebugMode){
        debugPrint("Eixo ${event.key} mudou para valor: ${event.value}");
        }
        // Lógica para quando o eixo é movido
        break;
      default:
      if(kDebugMode){
        debugPrint("Evento desconhecido: ${event.key}");
      }
    }
  }

  @override
  void onDetach() {
    // Cancela a assinatura ao sair do jogo
    _gamepadSubscription.cancel();
    super.onDetach();
  }
}