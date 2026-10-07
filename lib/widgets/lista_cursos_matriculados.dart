import 'package:flutter/material.dart';
import '../utils/constantes.dart';

/// COMPONENTE 4: Lista de cursos matriculados con Card (curso, docente, horario)
class ListaCursosMatriculados extends StatelessWidget {
  const ListaCursosMatriculados({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cursos Matriculados (Semestre 2026-II)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppConstantes.colorGranate.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '5 asignaturas',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppConstantes.colorGranate,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildItemCurso(
            codigo: 'IF616AIN',
            nombre: 'Desarrollo de Software II',
            docente: 'Mtro. Ing. Yover Collantes Valer',
            horario: 'Lun y Mié: 16:00 - 18:00 | Aula IN304',
            colorTag: Colors.red.shade700,
          ),
          _buildItemCurso(
            codigo: 'IF618AIN',
            nombre: 'Ingeniería de Software II',
            docente: 'Dr. Edwin Boza',
            horario: 'Mar y Jue: 14:00 - 16:00 | Lab 02',
            colorTag: Colors.blue.shade700,
          ),
          _buildItemCurso(
            codigo: 'IF620AIN',
            nombre: 'Minería de Datos',
            docente: 'Mgt. Rosa Cárdenas',
            horario: 'Vie: 08:00 - 12:00 | Lab 03',
            colorTag: Colors.teal.shade700,
          ),
          _buildItemCurso(
            codigo: 'IF622AIN',
            nombre: 'Robótica y Sistemas Autónomos',
            docente: 'Ing. Carlos Hurtado',
            horario: 'Mié: 09:00 - 12:00 | Lab 01',
            colorTag: Colors.purple.shade700,
          ),
        ],
      ),
    );
  }

  Widget _buildItemCurso({
    required String codigo,
    required String nombre,
    required String docente,
    required String horario,
    required Color colorTag,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: colorTag.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              codigo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: colorTag,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 14,
                      color: Colors.black45,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        docente,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 14, color: Colors.black45),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        horario,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black45,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
