import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/tramite_data.dart';
import '../models/tramite_model.dart';
import '../theme/app_theme.dart';
import '../widgets/tramite_card.dart';
import 'detalle_screen.dart';

class MisTramitesScreen extends StatefulWidget {
  const MisTramitesScreen({super.key});
  @override
  State<MisTramitesScreen> createState() => _MisTramitesScreenState();
}

class _MisTramitesScreenState extends State<MisTramitesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Tramite> _filtered(EstadoTramite? estado) {
    if (estado == null) return TramiteData.misTramietes;
    return TramiteData.misTramietes.where((t) => t.estado == estado).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Mis Trámites'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.accent,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          labelStyle: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          tabs: const [
            Tab(text: 'Todos'),
            Tab(text: 'En Proceso'),
            Tab(text: 'Pendientes'),
            Tab(text: 'Listos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _TramiteList(tramites: _filtered(null)),
          _TramiteList(tramites: _filtered(EstadoTramite.enProceso)),
          _TramiteList(tramites: _filtered(EstadoTramite.pendiente)),
          _TramiteList(tramites: _filtered(EstadoTramite.completado)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppTheme.primary,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text('Nuevo Trámite',
          style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
      ),
    );
  }
}

class _TramiteList extends StatelessWidget {
  final List<Tramite> tramites;
  const _TramiteList({required this.tramites});

  @override
  Widget build(BuildContext context) {
    if (tramites.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: AppTheme.textSecondary.withOpacity(0.4)),
            const SizedBox(height: 12),
            Text('No hay trámites en esta categoría',
              style: GoogleFonts.poppins(color: AppTheme.textSecondary, fontSize: 13)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tramites.length,
      itemBuilder: (context, i) => TramiteCard(
        tramite: tramites[i],
        onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => DetalleScreen(tramite: tramites[i]))),
      ),
    );
  }
}
