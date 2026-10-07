# Panel Académico de Control (Dashboard Universitario) — UNSAAC

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![Asignatura](https://img.shields.io/badge/Curso-Desarrollo%20de%20Software%20II-7A1F2B)](https://unsaac.edu.pe)
[![Grupo](https://img.shields.io/badge/Grupo-03-C9971F)]()

Interfaz de usuario (UI/UX) declarativa, responsiva y estática para el **Panel Académico de Control (Dashboard)** de la **Universidad Nacional de San Antonio Abad del Cusco (UNSAAC)**, desarrollada en el marco de la **Sesión 06** de la asignatura **Desarrollo de Software II (IF616AIN)**.

---

## 🏛️ Información Académica

* **Institución:** Universidad Nacional de San Antonio Abad del Cusco (UNSAAC)
* **Facultad:** Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica
* **Escuela Profesional:** Ingeniería Informática y de Sistemas
* **Asignatura:** Desarrollo de Software II (IF616AIN) — Semestre 2026-II
* **Docente:** Mtro. Ing. Yover Collantes Valer
* **Grupo Asignado:** **Grupo 03**
* **Integrantes:**
  * **Jairo Jaser Rodriguez Ccoyto** (Código: 221451)
  * **Joan Gonzalo Quispe Checya** (Código: 220552)

---

## 📱 Descripción del Proyecto

El tablero modela el portal central del estudiante universitario consolidando toda su actividad académica en una única vista ergonómica:
1. **Encabezado institucional y navegación:** Franja superior acreditada ICACIT y barra lateral (*Sidebar*) con accesos, badges de notificación y estado en línea del alumno.
2. **Cuatro tarjetas KPI adaptativas:** Créditos aprobados (184/220), promedio ponderado (16.42), progreso de carrera (83.6%) y actividades urgentes de la semana (03).
3. **Sección «Mis Cursos»:** Tarjetas ilustradas con banner temático, categoría de carrera, progreso porcentual, docente asignado y fechas de entrega.
4. **Panel Lateral de Calendario y Alertas:** Mini calendario mensual del ciclo y tarjetas con recordatorios clave de tareas y sustentaciones.
5. **Avance Curricular:** Barra de progreso LinearProgressIndicator con valor explícito (83.6%).
6. **Accesos Rápidos del Portal:** Rejilla GridView.count hacia Aula Virtual Moodle, Portal SIA, Biblioteca y Trámites.

---

## 📐 Arquitectura de Widgets y Modularización

El código sigue estrictamente el principio de responsabilidad única (*Single Responsibility Principle*) y arquitectura limpia:

`	ext
lib/
├── main.dart                          # Punto de entrada y configuración de ThemeData
├── utils/
│   └── constantes.dart                # Paleta institucional UNSAAC y métrica de 8 dp
├── screens/
│   └── dashboard_screen.dart          # Scaffold, LayoutBuilder y breakpoints adaptativos
└── widgets/
    ├── barra_institucional_superior.dart # Franja superior con escudos y títulos
    ├── menu_lateral_sidebar.dart         # Menú lateral con opciones y perfil del estudiante
    ├── saludo_buscador_header.dart       # Bienvenida personalizada y barra de búsqueda
    ├── seccion_kpis.dart                 # 4 tarjetas métricas adaptativas
    ├── tarjetas_cursos_grid.dart         # Tarjetas de asignaturas con avance
    ├── avance_curricular_card.dart       # Barra de progreso curricular (83.6%)
    ├── panel_calendario_alertas.dart     # Calendario mensual y próximas entregas
    ├── accesos_rapidos_grid.dart         # Rejilla de accesos al portal SIA/Moodle
    └── pie_pagina_institucional.dart     # Franja inferior con lema universitario
`

---

## 🛠️ Restricciones Técnicas Cumplidas

* **100% StatelessWidget:** Sin StatefulWidget, sin setState, sin gestores externos de estado (Provider, Riverpod, BLoC).
* **Zero Overflow:** Cero advertencias RenderFlex overflowed mediante Expanded, Flexible y SingleChildScrollView.
* **Solución a Unbounded Constraints:** Uso riguroso de shrinkWrap: true y NeverScrollableScrollPhysics en GridView anidado.
* **Diseño Adaptativo:** Breakpoints en 1050 dp y 1150 dp mediante LayoutBuilder para conmutar entre móvil, tableta y escritorio.
* **Accesibilidad:** Zonas táctiles mínimas de 48×48 dp y colores semánticos con contraste conforme a WCAG AA.
