import 'package:flutter/material.dart';

import '../utils/constantes.dart';

/// ============================================================================
/// COMPONENTE 4: TARJETAS DE CURSOS ILUSTRADAS CON PROGRESO Y DOCENTE
/// ============================================================================
/// 1. Banner ilustrado superior con degradado y micro-ícono decorativo de fondo.
/// 2. Chip de categoría (INGENIERÍA, TECNOLOGÍA, CIENCIA DE DATOS).
/// 3. LinearProgressIndicator individual por curso para mostrar el avance del ciclo.
/// 4. Manejo riguroso de textos largos mediante TextOverflow.ellipsis y maxLines: 1/2.
/// ============================================================================
class TarjetasCursosGrid extends StatelessWidget {
  const TarjetasCursosGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.menu_book,
                  color: AppConstantes.colorGranate,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Mis cursos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppConstantes.colorTextoPrincipal,
                  ),
                ),
              ],
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Text(
                'Ver todos los cursos',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              label: const Icon(Icons.arrow_forward, size: 14),
              style: TextButton.styleFrom(
                foregroundColor: AppConstantes.colorGranate,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        LayoutBuilder(
          builder: (context, constraints) {
            final ancho = constraints.maxWidth;

            final curso1 = _buildCardCurso(
              categoria: 'INGENIERÍA',
              colorCategoria: const Color(0xFF1E3A8A),
              colorBanner: const Color(0xFF1E40AF),
              iconoBanner: Icons.terminal_rounded,
              titulo: 'Desarrollo de Software II',
              descripcion: 'Arquitectura declarativa Flutter, patrones UI/UX y Clean Architecture.',
              progreso: 0.78,
              porcentajeTexto: '78%',
              docente: 'Prof. Yover Collantes Valer',
              fechaEntrega: 'Entrega: Hoy 23:59',
            );

            final curso2 = _buildCardCurso(
              categoria: 'TECNOLOGÍA',
              colorCategoria: const Color(0xFF0F766E),
              colorBanner: const Color(0xFF0D9488),
              iconoBanner: Icons.cloud_done_rounded,
              titulo: 'Ingeniería de Software II',
              descripcion: 'Modelado ágil, aseguramiento de la calidad y despliegue continuo.',
              progreso: 0.65,
              porcentajeTexto: '65%',
              docente: 'Dr. Edwin Boza',
              fechaEntrega: 'Entrega: 10/10/2026',
            );

            final curso3 = _buildCardCurso(
              categoria: 'CIENCIA DE DATOS',
              colorCategoria: const Color(0xFFB45309),
              colorBanner: const Color(0xFFD97706),
              iconoBanner: Icons.insights_rounded,
              titulo: 'Minería de Datos',
              descripcion: 'Descubrimiento de conocimiento en bases de datos y algoritmos de ML.',
              progreso: 0.90,
              porcentajeTexto: '90%',
              docente: 'Mgt. Rosa Cárdenas',
              fechaEntrega: 'Entrega: 14/10/2026',
            );

            // Disposición adaptativa según el ancho de pantalla evaluado:
            // - Ancho >= 850 dp: 3 tarjetas en fila horizontal (Row con Expanded x 3).
            // - Ancho 550 a 849 dp: 2 en fila + 1 abajo.
            // - Ancho < 550 dp: Las 3 apiladas individualmente.
            if (ancho >= 850) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: curso1),
                  const SizedBox(width: 16),
                  Expanded(child: curso2),
                  const SizedBox(width: 16),
                  Expanded(child: curso3),
                ],
              );
            } else if (ancho >= 550) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: curso1),
                      const SizedBox(width: 14),
                      Expanded(child: curso2),
                    ],
                  ),
                  const SizedBox(height: 14),
                  curso3,
                ],
              );
            } else {
              return Column(
                children: [
                  curso1,
                  const SizedBox(height: 14),
                  curso2,
                  const SizedBox(height: 14),
                  curso3,
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildCardCurso({
    required String categoria,
    required Color colorCategoria,
    required Color colorBanner,
    required IconData iconoBanner,
    required String titulo,
    required String descripcion,
    required double progreso,
    required String porcentajeTexto,
    required String docente,
    required String fechaEntrega,
  }) {
    return Container(
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
          // Banner superior decorado con Stack y LinearGradient
          Container(
            height: 95,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorBanner, colorBanner.withValues(alpha: 0.85)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppConstantes.radioTarjeta),
                topRight: Radius.circular(AppConstantes.radioTarjeta),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -10,
                  bottom: -15,
                  child: Icon(
                    iconoBanner,
                    size: 80,
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          categoria,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: colorCategoria,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.white70,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Cuerpo informativo con paddings y contención de desbordamientos
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppConstantes.colorTextoPrincipal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  descripcion,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppConstantes.colorTextoSecundario,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Barra de progreso y valor porcentual
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: progreso,
                          minHeight: 6,
                          backgroundColor: AppConstantes.colorFondo,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colorBanner,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      porcentajeTexto,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: colorBanner,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(height: 1, color: AppConstantes.colorBorde),
                const SizedBox(height: 10),

                // Datos de contacto del docente y fecha de entrega
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 14,
                      color: AppConstantes.colorTextoSecundario,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        docente,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppConstantes.colorTextoSecundario,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: AppConstantes.colorTextoSecundario,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        fechaEntrega,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppConstantes.colorTextoSecundario,
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
