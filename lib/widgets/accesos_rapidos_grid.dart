import 'package:flutter/material.dart';

import '../utils/constantes.dart';

/// ============================================================================
/// COMPONENTE 6: REJILLA DE ACCESOS RÁPIDOS (GRIDVIEW.COUNT ADAPTATIVO)
/// ============================================================================
/// 1. Un error clásico en Flutter ocurre al anidar GridView dentro de un SingleChildScrollView.
///    Como el scroll entrega altura infinita (unbounded height), el GridView colapsa.
/// 2. Solución técnica rigurosa:
///    - shrinkWrap: true (obliga al GridView a medir la sumatoria exacta de sus elementos).
///    - physics: NeverScrollableScrollPhysics() (desactiva el scroll interno y delega el desplazamiento al padre).
/// 3. Botones con feedback táctil con InkWell y Material transparente.
/// ============================================================================
class AccesosRapidosGrid extends StatelessWidget {
  const AccesosRapidosGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
          const Text(
            'Accesos Rápidos del Portal Universitario',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppConstantes.colorTextoPrincipal,
            ),
          ),
          const SizedBox(height: 14),

          // Rejilla de 2 columnas con acotamiento de scroll
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2.3,
            children: [
              _buildBotonAcceso(
                'Aula Virtual Moodle',
                Icons.computer,
                Colors.indigo,
              ),
              _buildBotonAcceso(
                'Portal SIA Académico',
                Icons.account_balance,
                AppConstantes.colorGranate,
              ),
              _buildBotonAcceso(
                'Biblioteca Virtual',
                Icons.local_library,
                Colors.teal,
              ),
              _buildBotonAcceso(
                'Mesa de Partes',
                Icons.email_outlined,
                Colors.orange.shade800,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBotonAcceso(String texto, IconData icono, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                Icon(icono, size: 20, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    texto,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
