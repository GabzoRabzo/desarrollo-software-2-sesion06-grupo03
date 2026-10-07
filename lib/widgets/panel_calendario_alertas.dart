import 'package:flutter/material.dart';

import '../utils/constantes.dart';

/// ============================================================================
/// COMPONENTE 5: PANEL LATERAL DE CALENDARIO ACADÉMICO Y ALERTAS/EVENTOS
/// ============================================================================
/// 1. Mini calendario universitario construido puramente con Row y Container circulares.
///    Resalta el día académico actual en granate institucional sin paquetes externos.
/// 2. Lista de alertas y recordatorios críticos (entregas, foros, sustentaciones).
/// 3. Botones con áreas táctiles accesibles superiores a 48x48 dp.
/// ============================================================================
class PanelCalendarioAlertas extends StatelessWidget {
  const PanelCalendarioAlertas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCalendarioCard(),
        const SizedBox(height: 20),
        _buildProximosEventosCard(),
      ],
    );
  }

  Widget _buildCalendarioCard() {
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
        children: [
          const Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: AppConstantes.colorGranate,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Calendario académico',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppConstantes.colorTextoPrincipal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Selector de mes con flechas de navegación
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.chevron_left,
                size: 20,
                color: AppConstantes.colorTextoSecundario,
              ),
              Text(
                'Octubre 2026',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppConstantes.colorTextoPrincipal,
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 20,
                color: AppConstantes.colorTextoSecundario,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Encabezado de los días de la semana
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _DiaSemanaText('Lun'),
              _DiaSemanaText('Mar'),
              _DiaSemanaText('Mié'),
              _DiaSemanaText('Jue'),
              _DiaSemanaText('Vie'),
              _DiaSemanaText('Sáb'),
              _DiaSemanaText('Dom'),
            ],
          ),
          const SizedBox(height: 8),

          // Cuadrícula de fechas con el día 16 destacado
          _buildFilaDias(
            ['28', '29', '30', '1', '2', '3', '4'],
            sonPrevios: [true, true, true, false, false, false, false],
          ),
          _buildFilaDias(['5', '6', '7', '8', '9', '10', '11']),
          _buildFilaDias([
            '12',
            '13',
            '14',
            '15',
            '16',
            '17',
            '18',
          ], diaResaltado: '16'),
          _buildFilaDias(['19', '20', '21', '22', '23', '24', '25']),
          _buildFilaDias(
            ['26', '27', '28', '29', '30', '31', '1'],
            sonSiguientes: [false, false, false, false, false, false, true],
          ),
        ],
      ),
    );
  }

  Widget _buildFilaDias(
    List<String> dias, {
    List<bool>? sonPrevios,
    List<bool>? sonSiguientes,
    String? diaResaltado,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: dias.asMap().entries.map((entry) {
          final idx = entry.key;
          final dia = entry.value;
          final esAtenuado =
              (sonPrevios != null && sonPrevios[idx]) ||
              (sonSiguientes != null && sonSiguientes[idx]);
          final esHoy = dia == diaResaltado;

          return Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: esHoy ? AppConstantes.colorGranate : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                dia,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: esHoy ? FontWeight.bold : FontWeight.w500,
                  color: esHoy
                      ? Colors.white
                      : (esAtenuado
                            ? Colors.grey.shade400
                            : AppConstantes.colorTextoPrincipal),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProximosEventosCard() {
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
          const Row(
            children: [
              Icon(Icons.bolt, color: AppConstantes.colorDorado, size: 20),
              SizedBox(width: 8),
              Text(
                'Próximos eventos & alertas',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppConstantes.colorTextoPrincipal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          _buildItemEvento(
            icono: Icons.description_outlined,
            colorIcono: const Color(0xFF1E7E34),
            colorFondoIcono: const Color(0xFFE8F5E9),
            titulo: 'Entrega: Guía 06 (DSII)',
            subtitulo: 'Desarrollo de Software II',
            fechaHora: 'Hoy, 23:59 hrs',
          ),
          const SizedBox(height: 12),

          _buildItemEvento(
            icono: Icons.groups_outlined,
            colorIcono: const Color(0xFF0D6EFD),
            colorFondoIcono: const Color(0xFFE3F2FD),
            titulo: 'Foro: Modelo de Restricciones',
            subtitulo: 'Desarrollo de Software II',
            fechaHora: 'Mañana, 18:00 hrs',
          ),
          const SizedBox(height: 12),

          _buildItemEvento(
            icono: Icons.desktop_windows_outlined,
            colorIcono: const Color(0xFFD97706),
            colorFondoIcono: const Color(0xFFFEF3C7),
            titulo: 'Sustentación Proyecto Grupal',
            subtitulo: 'Grupo 03 • Mtro. Collantes',
            fechaHora: 'Jueves, 16:00 hrs',
          ),
          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.event_note, size: 16),
              label: const Text(
                'Ver calendario completo',
                style: TextStyle(fontSize: 12),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppConstantes.colorGranate,
                side: const BorderSide(color: AppConstantes.colorBorde),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemEvento({
    required IconData icono,
    required Color colorIcono,
    required Color colorFondoIcono,
    required String titulo,
    required String subtitulo,
    required String fechaHora,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: colorFondoIcono,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icono, color: colorIcono, size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppConstantes.colorTextoPrincipal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subtitulo,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppConstantes.colorTextoSecundario,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                fechaHora,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: colorIcono,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DiaSemanaText extends StatelessWidget {
  final String dia;
  const _DiaSemanaText(this.dia);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      child: Center(
        child: Text(
          dia,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: AppConstantes.colorTextoSecundario,
          ),
        ),
      ),
    );
  }
}
