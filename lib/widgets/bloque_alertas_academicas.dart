import 'package:flutter/material.dart';

/// COMPONENTE 5: Bloque de alertas académicas con Wrap de Card
class BloqueAlertasAcademicas extends StatelessWidget {
  const BloqueAlertasAcademicas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.amber.shade900,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Alertas y Recordatorios Clave',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildAlertaChip(
                titulo: 'Entrega Guía 06 (DSII)',
                detalle: 'Vence hoy a las 23:59 hrs',
                icono: Icons.timer,
                colorFondo: Colors.red.shade50,
                colorBorde: Colors.red.shade200,
                colorTexto: Colors.red.shade900,
              ),
              _buildAlertaChip(
                titulo: 'Pago de Matrícula Regular',
                detalle: 'Verificado conforme (SIA)',
                icono: Icons.task_alt,
                colorFondo: Colors.green.shade50,
                colorBorde: Colors.green.shade200,
                colorTexto: Colors.green.shade900,
              ),
              _buildAlertaChip(
                titulo: 'Tutoría Universitaria',
                detalle: 'Jueves 15:00 en IN304',
                icono: Icons.event,
                colorFondo: Colors.blue.shade50,
                colorBorde: Colors.blue.shade200,
                colorTexto: Colors.blue.shade900,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlertaChip({
    required String titulo,
    required String detalle,
    required IconData icono,
    required Color colorFondo,
    required Color colorBorde,
    required Color colorTexto,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorBorde),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, size: 18, color: colorTexto),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: colorTexto,
                ),
              ),
              Text(
                detalle,
                style: TextStyle(
                  fontSize: 11,
                  color: colorTexto.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
