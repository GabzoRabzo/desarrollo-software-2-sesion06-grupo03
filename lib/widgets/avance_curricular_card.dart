import 'package:flutter/material.dart';

import '../utils/constantes.dart';

/// ============================================================================
/// COMPONENTE 3: INDICADOR DE AVANCE CURRICULAR EN LA CARRERA
/// ============================================================================
/// 1. Requerimiento oficial: LinearProgressIndicator con valor fijo numérico explícito (83.6%).
/// 2. Uso de ClipRRect para redondear los extremos de la barra de progreso a 8 dp.
/// 3. Tipografía jerarquizada de tres niveles: Título (15 dp), Porcentaje destacado y subtítulo descriptivo.
/// ============================================================================
class AvanceCurricularCard extends StatelessWidget {
  const AvanceCurricularCard({super.key});

  @override
  Widget build(BuildContext context) {
    const double avance = 0.836; // 83.6% (184 de 220 créditos aprobados)

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Avance Curricular en la Carrera',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppConstantes.colorTextoPrincipal,
                ),
              ),
              Text(
                '83.6 %',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppConstantes.colorGranate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Barra de progreso estilizada
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const LinearProgressIndicator(
              value: avance,
              minHeight: 10,
              backgroundColor: Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(
                AppConstantes.colorGranate,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '10° Semestre Académico | Plan de Estudios 2020 (Acreditado ICACIT)',
            style: TextStyle(
              fontSize: 12,
              color: AppConstantes.colorTextoSecundario,
            ),
          ),
        ],
      ),
    );
  }
}
