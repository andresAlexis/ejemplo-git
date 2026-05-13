import 'package:flutter/material.dart';

enum EstadoTramite { pendiente, enProceso, completado, rechazado }

class Tramite {
  final String id;
  final String nombre;
  final String descripcion;
  final String categoria;
  final IconData icono;
  final Color color;
  final int diasEstimados;
  final double progreso;
  final EstadoTramite estado;
  final String fechaSolicitud;
  final List<String> requisitos;

  const Tramite({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.categoria,
    required this.icono,
    required this.color,
    required this.diasEstimados,
    required this.progreso,
    required this.estado,
    required this.fechaSolicitud,
    required this.requisitos,
  });
}

class CategoriaTramite {
  final String nombre;
  final IconData icono;
  final Color color;
  final int cantidad;

  const CategoriaTramite({
    required this.nombre,
    required this.icono,
    required this.color,
    required this.cantidad,
  });
}
