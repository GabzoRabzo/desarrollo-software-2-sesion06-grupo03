// ============================================================================
// UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO
// Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica
// Escuela Profesional de Ingeniería Informática y de Sistemas
//
// ASIGNATURA : Desarrollo de Software II (IF616AIN) — Semestre 2026-II
// DOCENTE    : Mtro. Ing. Yover Collantes Valer
// GRUPO      : Grupo 03
// INTEGRANTES:
//   - Jairo Jaser Rodriguez Ccoyto (Código: 221451)
//   - Joan Gonzalo Quispe Checya   (Código: 220552)
//
// SESIÓN 06 — PROYECTO 3: PANEL ACADÉMICO DE CONTROL (DASHBOARD UNIVERSITARIO)
// ============================================================================

import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'utils/constantes.dart';

void main() {
  runApp(const DashboardGrupo03App());
}

// Alias de compatibilidad para pruebas automatizadas (widget_test.dart)
typedef MyApp = DashboardGrupo03App;

class DashboardGrupo03App extends StatelessWidget {
  const DashboardGrupo03App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Académico UNSAAC - Grupo 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Segoe UI',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppConstantes.colorGranate,
          primary: AppConstantes.colorGranate,
          secondary: AppConstantes.colorDorado,
        ),
        scaffoldBackgroundColor: AppConstantes.colorFondo,
        useMaterial3: true,
      ),
      home: const PantallaDashboardAcademico(),
    );
  }
}
