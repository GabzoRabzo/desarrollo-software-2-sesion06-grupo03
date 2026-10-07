import 'package:flutter/material.dart';
import '../utils/constantes.dart';

/// Barra lateral de navegación moderna (Sidebar) inspirada en el diseño de referencia
class MenuLateralSidebar extends StatelessWidget {
  const MenuLateralSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: AppConstantes.colorGranateOscuro,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Cabecera del Sidebar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white12, width: 1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppConstantes.colorDorado,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portal UNSAAC',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Pregrado 2026-II',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Lista de Opciones de Navegación
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              children: [
                _buildNavItem(
                  icono: Icons.dashboard_rounded,
                  titulo: 'Dashboard',
                  activo: true,
                ),
                _buildNavItem(
                  icono: Icons.menu_book_rounded,
                  titulo: 'Mis cursos',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.calendar_month_rounded,
                  titulo: 'Calendario',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.star_border_rounded,
                  titulo: 'Calificaciones',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.mail_outline_rounded,
                  titulo: 'Mensajes',
                  activo: false,
                  badgeTexto: '3',
                ),
                _buildNavItem(
                  icono: Icons.people_outline_rounded,
                  titulo: 'Docentes & Pares',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.folder_outlined,
                  titulo: 'Recursos SIA',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.local_library_outlined,
                  titulo: 'Biblioteca Virtual',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.forum_outlined,
                  titulo: 'Foros de Carrera',
                  activo: false,
                ),
                _buildNavItem(
                  icono: Icons.settings_outlined,
                  titulo: 'Configuración',
                  activo: false,
                ),
              ],
            ),
          ),

          // Widget Inferior de Perfil de Usuario
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white12, width: 1),
              ),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: AppConstantes.colorDorado,
                      child: Text(
                        'JR',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade700,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppConstantes.colorGranateOscuro,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Jairo Rodriguez',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Estudiante • En línea',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icono,
    required String titulo,
    required bool activo,
    String? badgeTexto,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: activo ? AppConstantes.colorDorado.withValues(alpha: 0.25) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: activo
            ? Border.all(color: AppConstantes.colorDorado.withValues(alpha: 0.6))
            : null,
      ),
      child: ListTile(
        dense: true,
        leading: Icon(
          icono,
          color: activo ? AppConstantes.colorDorado : Colors.white70,
          size: 20,
        ),
        title: Text(
          titulo,
          style: TextStyle(
            color: activo ? Colors.white : Colors.white70,
            fontSize: 13,
            fontWeight: activo ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        trailing: badgeTexto != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppConstantes.colorDorado,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeTexto,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
        onTap: () {},
      ),
    );
  }
}
