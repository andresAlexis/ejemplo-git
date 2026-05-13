import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/tramite_model.dart';
import '../theme/app_theme.dart';

class CategoriaChip extends StatelessWidget {
  final CategoriaTramite categoria;
  final VoidCallback? onTap;

  const CategoriaChip({super.key, required this.categoria, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.divider),
          boxShadow: [
            BoxShadow(
              color: categoria.color.withOpacity(0.06),
              blurRadius: 10, offset: const Offset(0, 3)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46, height: 46,
              decoration: BoxDecoration(
                color: categoria.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(categoria.icono, color: categoria.color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(categoria.nombre,
              style: GoogleFonts.poppins(
                fontSize: 11, fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary),
              textAlign: TextAlign.center, maxLines: 1,
              overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text('${categoria.cantidad} trámites',
              style: GoogleFonts.poppins(
                fontSize: 10, color: AppTheme.textSecondary),
              textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
