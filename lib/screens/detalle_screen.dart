import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/tramite_model.dart';
import '../theme/app_theme.dart';

class DetalleScreen extends StatelessWidget {
  final Tramite tramite;
  const DetalleScreen({super.key, required this.tramite});

  String get _estadoLabel {
    switch (tramite.estado) {
      case EstadoTramite.pendiente: return 'Pendiente';
      case EstadoTramite.enProceso: return 'En Proceso';
      case EstadoTramite.completado: return 'Completado';
      case EstadoTramite.rechazado: return 'Rechazado';
    }
  }

  Color get _estadoColor {
    switch (tramite.estado) {
      case EstadoTramite.pendiente: return AppTheme.warning;
      case EstadoTramite.enProceso: return AppTheme.primaryLight;
      case EstadoTramite.completado: return AppTheme.success;
      case EstadoTramite.rechazado: return AppTheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Detalle de Trámite'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [tramite.color, tramite.color.withOpacity(0.75)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(tramite.icono, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tramite.nombre,
                              style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 16,
                                fontWeight: FontWeight.w700)),
                            Text(tramite.id,
                              style: GoogleFonts.poppins(
                                color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Text(_estadoLabel,
                      style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 12,
                        fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Info boxes
            Row(
              children: [
                _infoBox(Icons.calendar_today_outlined, 'Solicitado', tramite.fechaSolicitud),
                const SizedBox(width: 12),
                _infoBox(Icons.schedule_outlined, 'Tiempo est.', '${tramite.diasEstimados} días'),
                const SizedBox(width: 12),
                _infoBox(Icons.category_outlined, 'Categoría', tramite.categoria),
              ],
            ),
            const SizedBox(height: 20),

            // Description
            Text('Descripción',
              style: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
            const SizedBox(height: 8),
            Text(tramite.descripcion,
              style: GoogleFonts.poppins(
                fontSize: 13, color: AppTheme.textSecondary, height: 1.6)),
            const SizedBox(height: 20),

            // Requisitos
            Text('Requisitos',
              style: GoogleFonts.poppins(
                fontSize: 15, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
            const SizedBox(height: 12),
            ...tramite.requisitos.asMap().entries.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.divider),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24, height: 24,
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('${e.key + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 11, fontWeight: FontWeight.w700,
                          color: AppTheme.primary)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(e.value,
                      style: GoogleFonts.poppins(
                        fontSize: 13, color: AppTheme.textPrimary)),
                  ),
                  if (tramite.estado == EstadoTramite.completado)
                    const Icon(Icons.check_circle, color: AppTheme.success, size: 18),
                ],
              ),
            )),

            const SizedBox(height: 24),
            if (tramite.estado != EstadoTramite.completado)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('Actualizar Estado'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.divider),
        ),
        child: Column(
          children: [
            Icon(icon, size: 18, color: AppTheme.primary),
            const SizedBox(height: 4),
            Text(label,
              style: GoogleFonts.poppins(fontSize: 10, color: AppTheme.textSecondary),
              textAlign: TextAlign.center),
            const SizedBox(height: 2),
            Text(value,
              style: GoogleFonts.poppins(
                fontSize: 11, fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary),
              textAlign: TextAlign.center,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
