import 'package:flutter/material.dart';

import '../utils/constantes.dart';

/// ============================================================================
/// COMPONENTE 2: CUATRO TARJETAS KPI ADAPTATIVAS (MÉTRICAS CLAVE)
/// ============================================================================
/// 1. Requerimiento oficial: Los valores numéricos son el foco visual (tamaño 22+, negrita).
/// 2. Uso semántico del color: Verde (créditos y avance), Azul (académico), Dorado (mérito), Púrpura (tareas).
/// 3. Comportamiento adaptativo tri-fásico con LayoutBuilder:
///    - Ancho >= 900 dp: 1 fila de 4 tarjetas usando Row + Expanded (reparto homogéneo).
///    - Ancho 550 a 899 dp: 2 filas con 2 tarjetas cada una (matriz 2x2).
///    - Ancho < 550 dp: 4 tarjetas apiladas en columna individual (cero desbordamientos en móvil).
/// ============================================================================
class SeccionKPIs extends StatelessWidget {
  const SeccionKPIs({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final ancho = constraints.maxWidth;

        // KPI 1: Créditos aprobados en el plan de estudios
        final card1 = _buildKpiCard(
          icono: Icons.school_outlined,
          colorFondoIcono: const Color(0xFFE8F5E9),
          colorIcono: const Color(0xFF2E7D32),
          valor: '184',
          titulo: 'Créditos activos',
          subtitulo: '184 / 220 créditos',
          accionTexto: 'Ver plan',
        );

        // KPI 2: Promedio ponderado acumulado
        final card2 = _buildKpiCard(
          icono: Icons.auto_stories_outlined,
          colorFondoIcono: const Color(0xFFE3F2FD),
          colorIcono: const Color(0xFF1565C0),
          valor: '16.42',
          titulo: 'Promedio ponderado',
          subtitulo: 'Escala vigesimal',
          accionTexto: 'Ver récord',
        );

        // KPI 3: Porcentaje de avance de carrera
        final card3 = _buildKpiCard(
          icono: Icons.emoji_events_outlined,
          colorFondoIcono: const Color(0xFFFEF3C7),
          colorIcono: const Color(0xFFD97706),
          valor: '83.6%',
          titulo: 'Progreso de carrera',
          subtitulo: '10° Semestre',
          accionTexto: 'Ver avance',
        );

        // KPI 4: Actividades académicas y tareas pendientes de la semana
        final card4 = _buildKpiCard(
          icono: Icons.assignment_outlined,
          colorFondoIcono: const Color(0xFFEDE7F6),
          colorIcono: const Color(0xFF6A1B9A),
          valor: '03',
          titulo: 'Actividades semana',
          subtitulo: 'Tareas pendientes',
          accionTexto: 'Ver calendario',
        );

        // Distribución proporcional del ancho disponible mediante Expanded:
        // En pantallas amplias, cada tarjeta está envuelta en Expanded dentro de la Row.
        // Esto obliga a que el ancho total se divida exactamente entre 4, sin espacios sobrantes.
        if (ancho >= 900) {
          return Row(
            children: [
              Expanded(child: card1),
              const SizedBox(width: 14),
              Expanded(child: card2),
              const SizedBox(width: 14),
              Expanded(child: card3),
              const SizedBox(width: 14),
              Expanded(child: card4),
            ],
          );
        } else if (ancho >= 550) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: card1),
                  const SizedBox(width: 12),
                  Expanded(child: card2),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: card3),
                  const SizedBox(width: 12),
                  Expanded(child: card4),
                ],
              ),
            ],
          );
        } else {
          return Column(
            children: [
              card1,
              const SizedBox(height: 10),
              card2,
              const SizedBox(height: 10),
              card3,
              const SizedBox(height: 10),
              card4,
            ],
          );
        }
      },
    );
  }

  // Modelo de caja con bordes redondeados y separación perimetral:
  // Se usa BoxDecoration con color, bordes sutiles y sombra difuminada al 5%.
  // Se separa padding (aire interno de 16 dp) de la estructura del hijo.
  Widget _buildKpiCard({
    required IconData icono,
    required Color colorFondoIcono,
    required Color colorIcono,
    required String valor,
    required String titulo,
    required String subtitulo,
    required String accionTexto,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppConstantes.colorTarjeta,
        borderRadius: BorderRadius.circular(AppConstantes.radioTarjeta),
        border: Border.all(color: AppConstantes.colorBorde),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Contenedor circular pastel que aloja el ícono representativo
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colorFondoIcono,
                  shape: BoxShape.circle,
                ),
                child: Center(child: Icon(icono, color: colorIcono, size: 22)),
              ),
              const SizedBox(width: 12),
              // [PREVENCIÓN DE OVERFLOW]:
              // El título y valor están en Expanded con TextOverflow.ellipsis para evitar
              // que números o textos largos desborden la tarjeta en anchos estrechos.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valor,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppConstantes.colorTextoPrincipal,
                      ),
                    ),
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppConstantes.colorTextoSecundario,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppConstantes.colorBorde),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitulo,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppConstantes.colorTextoSecundario,
                ),
              ),
              Text(
                accionTexto,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: colorIcono,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
