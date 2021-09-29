import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  String id;
  FlMeta fFlMeta;
  String descripcion;
  DetalleDeLaInversion detalleDeLaInversion;
  String ubicacion;
  String urlInversion;
  int order;
  String nombreProyecto;
  bool proximamente;

  ProjectModel({this.id, this.fFlMeta, this.descripcion, this.detalleDeLaInversion, this.ubicacion, this.urlInversion, this.order, this.nombreProyecto, this.proximamente});

  ProjectModel.fromJson(QueryDocumentSnapshot json) {
    id = json['id'];
    fFlMeta = json['_fl_meta_'] != null ? new FlMeta.fromJson(json['_fl_meta_']) : null;
    descripcion = json['descripcion'];
    detalleDeLaInversion = json['detalleDeLaInversion'] != null ? new DetalleDeLaInversion.fromJson(json['detalleDeLaInversion']) : null;
    ubicacion = json['ubicacion'];
    urlInversion = json['urlInversion'];
    order = json['order'];
    nombreProyecto = json['nombreProyecto'];
    proximamente = json['proximamente'];
  }

  ProjectModel.fromSnapshot(DocumentSnapshot json) {
    id = json['id'];
    fFlMeta = json['_fl_meta_'] != null ? new FlMeta.fromJson(json['_fl_meta_']) : null;
    descripcion = json['descripcion'];
    detalleDeLaInversion = json['detalleDeLaInversion'] != null ? new DetalleDeLaInversion.fromJson(json['detalleDeLaInversion']) : null;
    ubicacion = json['ubicacion'];
    urlInversion = json['urlInversion'];
    order = json['order'];
    nombreProyecto = json['nombreProyecto'];
    proximamente = json['proximamente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.fFlMeta != null) {
      data['_fl_meta_'] = this.fFlMeta.toJson();
    }
    data['descripcion'] = this.descripcion;
    if (this.detalleDeLaInversion != null) {
      data['detalleDeLaInversion'] = this.detalleDeLaInversion.toJson();
    }
    data['ubicacion'] = this.ubicacion;
    data['urlInversion'] = this.urlInversion;
    data['order'] = this.order;
    data['nombreProyecto'] = this.nombreProyecto;
    data['proximamente'] = this.proximamente;
    return data;
  }
}

class FlMeta {
  String docId;
  String schema;
  String schemaType;
  String createdBy;
  String env;
  String lastModifiedBy;
  String status;
  String flId;

  FlMeta({this.docId, this.schema, this.schemaType, this.createdBy, this.env, this.lastModifiedBy, this.status, this.flId});

  FlMeta.fromJson(Map<String, dynamic> json) {
    docId = json['docId'];
    schema = json['schema'];
    schemaType = json['schemaType'];
    createdBy = json['createdBy'];
    env = json['env'];
    lastModifiedBy = json['lastModifiedBy'];
    status = json['status'];
    flId = json['fl_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docId'] = this.docId;
    data['schema'] = this.schema;
    data['schemaType'] = this.schemaType;
    data['createdBy'] = this.createdBy;
    data['env'] = this.env;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['status'] = this.status;
    data['fl_id'] = this.flId;
    return data;
  }
}

class DetalleDeLaInversion {
  double porcentaje;
  int valorArpis;
  String nInversionistas;
  String acciones;
  int acionesDisponibles;

  DetalleDeLaInversion({this.porcentaje, this.valorArpis, this.nInversionistas, this.acciones, this.acionesDisponibles});

  DetalleDeLaInversion.fromJson(Map<String, dynamic> json) {
    porcentaje =  json['porcentaje'].toDouble();
    valorArpis = json['valorArpis'];
    nInversionistas = json['nInversionistas'];
    acciones = json['accionM2'];
    acionesDisponibles = json['acionesDisponibles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['porcentaje'] = this.porcentaje;
    data['valorArpis'] = this.valorArpis;
    data['nInversionistas'] = this.nInversionistas;
    data['accionM2'] = this.acciones;
    data['acionesDisponibles'] = this.acionesDisponibles;
    return data;
  }
}
