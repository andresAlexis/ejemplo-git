import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../models/tramite_model.dart';
import '../theme/app_theme.dart';

class TramiteCard extends StatelessWidget {
  final Tramite tramite;
  final VoidCallback? onTap;

  const TramiteCard({super.key, required this.tramite, this.onTap});

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.divider),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: tramite.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(tramite.icono, color: tramite.color, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tramite.nombre,
                          style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary),
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 2),
                        Text(tramite.id,
                          style: GoogleFonts.poppins(
                            fontSize: 11, color: AppTheme.textSecondary)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _estadoColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(_estadoLabel,
                      style: GoogleFonts.poppins(
                        fontSize: 11, fontWeight: FontWeight.w600,
                        color: _estadoColor)),
                  ),
                ],
              ),
              if (tramite.estado != EstadoTramite.completado) ...[
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Progreso',
                      style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.textSecondary)),
                    Text('${(tramite.progreso * 100).toInt()}%',
                      style: GoogleFonts.poppins(
                        fontSize: 11, fontWeight: FontWeight.w600, color: AppTheme.primary)),
                  ],
                ),
                const SizedBox(height: 6),
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  lineHeight: 6,
                  percent: tramite.progreso,
                  backgroundColor: AppTheme.divider,
                  progressColor: tramite.color,
                  barRadius: const Radius.circular(4),
                ),
              ],
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                    size: 13, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('Solicitado: ${tramite.fechaSolicitud}',
                    style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.textSecondary)),
                  const Spacer(),
                  Icon(Icons.schedule_outlined, size: 13, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('${tramite.diasEstimados} días est.',
                    style: GoogleFonts.poppins(fontSize: 11, color: AppTheme.textSecondary)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
