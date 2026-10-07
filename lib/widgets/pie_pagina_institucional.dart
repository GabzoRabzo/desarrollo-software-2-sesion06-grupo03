import 'package:flutter/material.dart';
import '../utils/constantes.dart';

/// Franja inferior institucional con lema universitario y créditos
class PieDePaginaInstitucional extends StatelessWidget {
  const PieDePaginaInstitucional({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        color: AppConstantes.colorGranateOscuro,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star, color: AppConstantes.colorDorado, size: 14),
          const SizedBox(width: 10),
          const Flexible(
            child: Text(
              'Universidad Nacional de San Antonio Abad del Cusco — Formamos profesionales con excelencia y rigor científico',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.star, color: AppConstantes.colorDorado, size: 14),
        ],
      ),
    );
  }
}
