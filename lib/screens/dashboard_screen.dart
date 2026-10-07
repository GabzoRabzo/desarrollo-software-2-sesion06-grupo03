import 'package:flutter/material.dart';

import '../utils/constantes.dart';
import '../widgets/barra_institucional_superior.dart';
import '../widgets/menu_lateral_sidebar.dart';
import '../widgets/saludo_buscador_header.dart';
import '../widgets/seccion_kpis.dart';
import '../widgets/tarjetas_cursos_grid.dart';
import '../widgets/avance_curricular_card.dart';
import '../widgets/panel_calendario_alertas.dart';
import '../widgets/accesos_rapidos_grid.dart';
import '../widgets/pie_pagina_institucional.dart';

/// ============================================================================
/// PANTALLA PRINCIPAL: ORQUESTADOR ADAPTATIVO DEL DASHBOARD ACADÉMICO
/// ============================================================================
/// 1. Esta pantalla actúa como el "Controlador Visual" de la interfaz.
/// 2. Implementa el principio de "Constraints go down, sizes go up, parent sets position".
/// 3. Utiliza LayoutBuilder en lugar de MediaQuery para evaluar las restricciones
///    locales del viewport (ancho real concedido al cuerpo del Scaffold).
/// ============================================================================
class PantallaDashboardAcademico extends StatelessWidget {
  const PantallaDashboardAcademico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantes.colorFondo,

      // En anchos reducidos (< 1050 dp), la barra lateral se oculta y se delega a este
      // Drawer deslizable accesible desde el menú hamburguesa del AppBar.
      drawer: const Drawer(child: MenuLateralSidebar()),

      // Cabecera superior adaptativa:
      // En escritorio muestra la barra institucional completa (logo, facultad, acreditación).
      // En móvil muestra un AppBar compacto con acciones rápidas.
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // [BREAKPOINT 1]: A partir de 1050 dp pasamos a la experiencia de escritorio
            final esDesktop = constraints.maxWidth >= 1050;
            if (esDesktop) {
              return const BarraInstitucionalSuperior();
            }
            return AppBar(
              title: const Text(
                'Portal Académico UNSAAC',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppConstantes.colorGranate,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  tooltip: 'Buscar',
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                  tooltip: 'Alertas',
                ),
                const SizedBox(width: 8),
              ],
            );
          },
        ),
      ),

      // Cuerpo principal con evaluación de restricciones locales
      body: LayoutBuilder(
        builder: (context, constraints) {
          final anchoTotal = constraints.maxWidth;
          final esEscritorio = anchoTotal >= 1050;

          return Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Si estamos en pantalla ancha, el menú lateral permanece anclado a la izquierda.
                    if (esEscritorio) const MenuLateralSidebar(),

                    // Todo el contenido central está protegido por SingleChildScrollView.
                    // Si la pantalla disminuye de altura o se abre un teclado, la UI hace scroll
                    // en vez de arrojar la temida franja amarilla y negra de desbordamiento.
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: ConstrainedBox(
                            // ConstrainedBox acota el ancho máximo para no deformar la UI en monitores ultrawide
                            constraints: const BoxConstraints(maxWidth: 1400),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 1. Saludo institucional y campo de búsqueda rápido
                                const SaludoBuscadorHeader(),
                                const SizedBox(height: 20),

                                // 2. Fila/Matriz de 4 tarjetas KPI con valores cuantitativos destacados
                                const SeccionKPIs(),
                                const SizedBox(height: 24),

                                // En escritorio (>= 1150 dp) dividimos el espacio con una Row:
                                // - Columna izquierda (flex: 68): Cursos matriculados, avance curricular y accesos.
                                // - Columna derecha (flex: 32): Mini calendario académico y alertas próximas.
                                // En tableta/móvil: Se apilan linealmente en una sola columna vertical.
                                if (anchoTotal >= 1150)
                                  const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 68,
                                        child: Column(
                                          children: [
                                            TarjetasCursosGrid(),
                                            SizedBox(height: 20),
                                            AvanceCurricularCard(),
                                            SizedBox(height: 20),
                                            AccesosRapidosGrid(),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        flex: 32,
                                        child: PanelCalendarioAlertas(),
                                      ),
                                    ],
                                  )
                                else
                                  const Column(
                                    children: [
                                      TarjetasCursosGrid(),
                                      SizedBox(height: 20),
                                      PanelCalendarioAlertas(),
                                      SizedBox(height: 20),
                                      AvanceCurricularCard(),
                                      SizedBox(height: 20),
                                      AccesosRapidosGrid(),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Franja inferior fija institucional (Footer)
              const PieDePaginaInstitucional(),
            ],
          );
        },
      ),
    );
  }
}
