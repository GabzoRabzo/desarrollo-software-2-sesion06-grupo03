import 'package:flutter/material.dart';
import '../utils/constantes.dart';

/// Componente de bienvenida y barra de búsqueda
class SaludoBuscadorHeader extends StatelessWidget {
  const SaludoBuscadorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final esAngosto = constraints.maxWidth < 650;

        if (esAngosto) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSaludo(),
              const SizedBox(height: 12),
              _buildBuscador(),
            ],
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildSaludo()),
            const SizedBox(width: 16),
            SizedBox(width: 280, child: _buildBuscador()),
          ],
        );
      },
    );
  }

  Widget _buildSaludo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '¡Bienvenido, Jairo!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppConstantes.colorTextoPrincipal,
              ),
            ),
            SizedBox(width: 8),
            Text('👋', style: TextStyle(fontSize: 22)),
          ],
        ),
        SizedBox(height: 4),
        Text(
          'Este es tu espacio de aprendizaje. Explora tus cursos y continúa tu formación.',
          style: TextStyle(
            fontSize: 13,
            color: AppConstantes.colorTextoSecundario,
          ),
        ),
      ],
    );
  }

  Widget _buildBuscador() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppConstantes.colorBorde),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 20, color: AppConstantes.colorTextoSecundario),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Buscar cursos, recursos...',
              style: TextStyle(
                fontSize: 12,
                color: AppConstantes.colorTextoSecundario,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
