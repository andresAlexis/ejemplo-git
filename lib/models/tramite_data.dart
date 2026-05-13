import 'package:flutter/material.dart';
import 'tramite_model.dart';

class TramiteData {
  static const List<CategoriaTramite> categorias = [
    CategoriaTramite(nombre: 'Licencias', icono: Icons.badge_outlined, color: Color(0xFF0D2B6B), cantidad: 8),
    CategoriaTramite(nombre: 'Pagos', icono: Icons.receipt_long_outlined, color: Color(0xFFD4A017), cantidad: 12),
    CategoriaTramite(nombre: 'Certificados', icono: Icons.workspace_premium_outlined, color: Color(0xFF1DB87E), cantidad: 6),
    CategoriaTramite(nombre: 'Permisos', icono: Icons.gavel_outlined, color: Color(0xFF7C3AED), cantidad: 9),
    CategoriaTramite(nombre: 'Registro', icono: Icons.how_to_reg_outlined, color: Color(0xFFE53E3E), cantidad: 5),
    CategoriaTramite(nombre: 'Consultas', icono: Icons.help_outline, color: Color(0xFF0891B2), cantidad: 14),
  ];

  static const List<Tramite> misTramietes = [
    Tramite(
      id: 'TRM-2024-001',
      nombre: 'Licencia de Funcionamiento',
      descripcion: 'Licencia para apertura de negocio comercial en zona urbana',
      categoria: 'Licencias',
      icono: Icons.store_outlined,
      color: Color(0xFF0D2B6B),
      diasEstimados: 15,
      progreso: 0.65,
      estado: EstadoTramite.enProceso,
      fechaSolicitud: '12/04/2025',
      requisitos: [
        'Fotocopia CI propietario',
        'Plano de ubicación',
        'Certificado de uso de suelo',
        'Pago de tasa municipal',
      ],
    ),
    Tramite(
      id: 'TRM-2024-002',
      nombre: 'Certificado de No Adeudo',
      descripcion: 'Certificación de inexistencia de deudas tributarias municipales',
      categoria: 'Certificados',
      icono: Icons.verified_outlined,
      color: Color(0xFF1DB87E),
      diasEstimados: 3,
      progreso: 1.0,
      estado: EstadoTramite.completado,
      fechaSolicitud: '05/04/2025',
      requisitos: [
        'Fotocopia CI',
        'Número de padrón municipal',
      ],
    ),
    Tramite(
      id: 'TRM-2024-003',
      nombre: 'Permiso de Construcción',
      descripcion: 'Autorización para construcción de vivienda unifamiliar',
      categoria: 'Permisos',
      icono: Icons.construction_outlined,
      color: Color(0xFF7C3AED),
      diasEstimados: 30,
      progreso: 0.2,
      estado: EstadoTramite.pendiente,
      fechaSolicitud: '18/04/2025',
      requisitos: [
        'Planos aprobados por arquitecto',
        'Escritura del terreno',
        'Comprobante de pago de impuestos',
        'Formulario de solicitud',
        'Fotografías del terreno',
      ],
    ),
  ];

  static const List<Map<String, dynamic>> noticias = [
    {
      'titulo': 'Nuevo sistema de pagos en línea',
      'resumen': 'A partir del 1 de junio podrás pagar todos tus trámites desde casa.',
      'fecha': 'Hoy',
      'icono': Icons.payment,
      'color': Color(0xFF0D2B6B),
    },
    {
      'titulo': 'Horario extendido en ventanillas',
      'resumen': 'Las oficinas atenderán hasta las 18:00 durante mayo y junio.',
      'fecha': 'Hace 2 días',
      'icono': Icons.access_time,
      'color': Color(0xFFD4A017),
    },
  ];
}
