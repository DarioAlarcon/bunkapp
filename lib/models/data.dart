import 'package:flutter/material.dart';
import 'package:bunkapp/models/belts.dart';

final listCategory = ['Indumentaria', 'Rango', 'Competencia'];

final listShoes = [
  Belts(
    'KARATEGI', 
    'INDUMENTARIA', 
    ' ', 
    4, 
    [
      ImageBelts(
      "assets/img/karategui_02.png",
      const Color.fromARGB(255, 28, 141, 153),
      "El karategi es una prenda muy importante en el karate, y su uso es considerado un signo de respeto y disciplina hacia el arte marcial y sus practicantes, consta de dos piezas: el uwagi (chaqueta) y el zubon (pantalón)"
      ),
      ImageBelts(
      "assets/img/karategui_03.png",
      const Color.fromARGB(255, 190, 196, 84),
      "KUMITE: suele tener un diseño más ajustado y ceñido al cuerpo,  Esto se debe a que los movimientos son más rápidos y explosivos, por lo que es importante que la prenda no restrinja la libertad de movimiento del practicante"
      ),
      ImageBelts(
      "assets/img/karategui_01.png",
      const Color.fromARGB(255, 103, 0, 126),
      "KATA: está hecho de un material de alta calidad que es más resistente y duradero. Esto se debe a que el kata implica movimientos más lentos y controlados, pero que pueden requerir más resistencia del tejido del uniforme"
      ),
      
    ]
  ),
  Belts(
    'CINTAS', 
    'RANGO', 
    ' ', 
    2, 
    [
      ImageBelts(
      "assets/img/white_belt01.png",
      const Color.fromARGB(255, 109, 109, 109),
      "Los estudiantes suelen aprender los conceptos básicos del karate, incluyendo la postura, las técnicas de puño y patada, y algunos términos japoneses."
      ),
      ImageBelts(
      "assets/img/yellow_belt01.png",
      const Color.fromARGB(255, 255, 251, 85),
      "deben conocer los conceptos y habilidades básicas del karate, como la defensa básica, la movilidad y la ejecución correcta de técnicas básicas"
      ),
      ImageBelts(
      "assets/img/orange_belt01.png",
      const Color.fromARGB(255, 255, 148, 81),
      "los estudiantes han desarrollado un nivel básico de habilidades en kata y kumite, además de tener una comprensión sólida de los fundamentos del karate."
      ),
      ImageBelts(
      "assets/img/blue_belt01.png",
      const Color.fromARGB(255, 32, 170, 216),
      "se debe tener un alto nivel de habilidad técnica y teórica en el karate, y ser capaces de ejecutar kata y kumite con precisión y fluidez."
      ),
      ImageBelts(
      "assets/img/green_belt01.png", 
      const Color.fromARGB(255, 143, 255, 181),
      "se debee haber perfeccionado sus habilidades en kata y kumite, además de tener una comprensión más profunda de los conceptos técnicos y teóricos del karate"
      ),
      ImageBelts(
      "assets/img/purple_belt01.png",
      const Color.fromARGB(255, 170, 144, 255),
      "se debe haber completado una cantidad significativa de tiempo de entrenamiento y hayan demostrado habilidades avanzadas en kihon (técnicas básicas), kata y kumite."
      ),
      ImageBelts(
      "assets/img/brown_belt01.png",
      const Color.fromARGB(255, 189, 140, 80),
      "deben tener un conocimiento avanzado de los principios técnicos y teóricos del karate, y ser capaces de realizar kata y kumite con gran precisión y poder."
      ),
      ImageBelts(
      "assets/img/black_belt01.png",
      const Color.fromARGB(255, 20, 20, 27),
      "se debe demostrar un conocimiento completo y profundo de los principios técnicos y teóricos del karate, y ser capaces de realizar kata y kumite a un nivel muy alto de habilidad y fluidez"
      ),
      
    ]
  ),
  Belts(
    'PROTECCIONES', 
    'COMPETENCIA', 
    ' ', 
    4, 
    [
      ImageBelts(
      "assets/img/protecciones_blue.png",
      const Color.fromARGB(255, 88, 155, 2238),
      "se utilizan diferentes tipos de protecciones para reducir el riesgo de lesiones durante el entrenamiento y la competición. Guantines, canilleras, botines, bucales y pecheras"
      ),
      ImageBelts(
      "assets/img/protecciones_red.png",
      const Color.fromARGB(255, 251, 77, 76),
      "se utilizan diferentes tipos de protecciones para reducir el riesgo de lesiones durante el entrenamiento y la competición. Guantines, canilleras, botines, bucales y pecheras"
      ),
    ]
  ),
];