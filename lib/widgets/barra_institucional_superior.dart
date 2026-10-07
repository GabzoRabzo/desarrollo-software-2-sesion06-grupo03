import 'package:flutter/material.dart';
import '../utils/constantes.dart';

/// Franja superior institucional con logos y títulos universitarios
class BarraInstitucionalSuperior extends StatelessWidget {
  const BarraInstitucionalSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppConstantes.colorBorde, width: 1.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Lado Izquierdo: Facultad y Universidad
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppConstantes.colorGranate.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppConstantes.colorGranate, width: 1.5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.account_balance,
                    color: AppConstantes.colorGranate,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppConstantes.colorGranate,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppConstantes.colorTextoSecundario,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Lado Derecho: Escuela Profesional e Indicador
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppConstantes.colorDoradoClaro,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppConstantes.colorDorado),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified, size: 16, color: AppConstantes.colorDorado),
                SizedBox(width: 6),
                Text(
                  'Ing. Informática y de Sistemas | Acreditada',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8C6207),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
