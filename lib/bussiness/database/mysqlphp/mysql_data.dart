import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ministerio_de_salud/bussiness/models.dart/model_danos_personal_de_salud.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_acciones2.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_establecimiento.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_desastre_requerimientos.dart';
import 'package:ministerio_de_salud/bussiness/models.dart/model_edan.dart';

String apiBase = "http://186.121.214.199";
// String apiBase = "http://47.243.63.127/pncad"; //http://47.243.63.127/pncad/

getMethod() async {
  try {
    String theUrl = "$apiBase/getData.php";
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    var responseBody = json.decode(res.body);

    print("#######################################");
    print(responseBody);
    print("#######################################");
  } catch (e) {
    print("#######################################");
    print(e);
    print("#######################################");
  }
}

Future<int> getLastIdEdan() async {
  String theUrl = "$apiBase/getLastIdEdan.php";
  var res = await http
      .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
  var responseBody = json.decode(res.body);
  int lastId = int.parse(responseBody[0]['cod_edan'].toString()) + 1;
  return lastId;

  // print("####################################### $lastId");
  // print(responseBody[0]['cod_edan']);
  // print("#######################################");
}

insertMethod(String codpersonal, String tipopersonal) async {
  String theUrl = "$apiBase/insertData.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "codpersonal": codpersonal,
    "tipopersonal": tipopersonal,
  });
  print(res.body);
}

Future<bool> insertEdan(ModelEdan edan) async {
  String theUrl = "$apiBase/insertEdan.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "tipo_edan": edan.tipoEdan,
    "evento": edan.evento,
    "clase_evento": edan.claseEvento,
    // "fecha": DateFormat("dd-MM-yyyy").parse(edan.fecha!.replaceAll('/', '-')),
    "fecha": edan.fecha!.replaceAll('/', '-'),
    "hora": edan.hora,
    "continua": edan.continua,
    "nombre": edan.nombre,
    "cargo": edan.cargo,
    "dreccion": edan.dreccion,
    "tel_fc": edan.telFc,
    "tel_cc": edan.telCc,
    "depto": edan.depto,
    "municipio": edan.municipio,
    "comunidad": edan.comunidad,
    "tiene_coord": edan.tieneCoord,
    "coordenada_x": edan.coordenadaX,
    "coordenada_y": edan.coordenadaY,
    "aereo": edan.aereo,
    "terrestre": edan.terrestre,
    "fluvial": edan.fluvial,
    "ferroviario": edan.ferroviario,
    "partida": edan.partida,
    "hora_llegada": edan.horaLlegada,
    "clima": edan.clima,
    "medio_comunicacion": edan.medioComunicacion,
    "canal": edan.canal,
    "nombre_emisora": edan.nombreEmisora,
    "dial_emisora": edan.dialEmisora,
    "telefono_emisora": edan.telefonoEmisora,
    "viviendas": edan.viviendas.toString(),
    "familias": edan.familias.toString(),
    "ninios": edan.ninios.toString(),
    "ninias": edan.ninias.toString(),
    "discapacidad": edan.discapacidad.toString(),
    "discapacidadm": edan.discapacidadm.toString(),
    "embarazadas": edan.embarazadas.toString(),
    "adulto_mayor": edan.adultoMayor.toString(),
    "adulto_mayorm": edan.adultoMayorm.toString(),
    "num_albergues": edan.numAlbergues.toString(),
    "agua": edan.agua,
    "basura": edan.basura,
    "alcantarillado": edan.alcantarillado,
    "electricidad": edan.electricidad,
    "telecom": edan.telecom,
    "transporte": edan.transporte,
    "establecimientossalud": edan.establecimientossalud,
    "heridos": edan.heridos.toString(),
    "muertos": edan.muertos.toString(),
    "desaparecidos": edan.desaparecidos.toString(),
    "lesionados": edan.lesionados.toString(),
    "otra_organizacion": edan.otraOrganizacion,
    "sci": edan.sci == null ? edan.sci.toString().substring(0, 1) : 'L',
    "sci_donde": edan.sciDonde,
    "lugar_lle": edan.lugarLle,
    "fecha_lle": edan.fechaLle,
    "hora_lle": edan.horaLle,
    "responsable_lle": edan.responsableLle,
    "cargo_lle": edan.cargoLle,
    "telf_fijo_lle": edan.telfFijoLle,
    "telf_cel_lle": edan.telfCelLle,
    "email": edan.email,
    "usuario": edan.usuario,
    "fechap": edan.fechap,
  });
  print('=====');
  print(res.body.toString());
  print('=====');
  print('===== ${res.body.toString().contains('Invalid')}');
  if (res.body.toString().contains('Invalid')) {
    print('- entro a true false');
    return false;
  } else {
    print('- entro a false true');
    return true;
  }
}

Future<bool> insertdesastreestablecimiento(Desastreestablecimiento data) async {
  String theUrl = "$apiBase/insertdesastreestablecimiento.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "coddesastreestablecimiento": data.coddesastreestablecimiento.toString(),
    "cod_edan": data.codEdan.toString(),
    "nomestablecimiento": data.nomestablecimiento,
    "funciona": data.funciona,
    "tieneagua": data.tieneagua,
    "area_afectada": data.areaAfectada,
  });
  print('=====');
  print(res.body.toString());
  print('=====');
  print('===== ${res.body.toString().contains('Invalid')}');
  if (res.body.toString().contains('Invalid')) {
    print('- entro a true false');
    return false;
  } else {
    print('- entro a false true');
    return true;
  }
}

Future<bool> insertDaniosPersonalDeSalud(Danospersonaldesalud data) async {
  String theUrl = "$apiBase/insertdanospersonaldesalud.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "codpersalud": data.codpersalud.toString(),
    "cod_edan": data.codEdan.toString(),
    "personal": data.personal.toString(),
    "muertos": data.muertos.toString(),
    "heridos": data.heridos.toString(),
    "enfermos": data.enfermos.toString(),
    "disponibles": data.disponibles.toString(),
    "desaparecidos": data.desaparecidos.toString(),
    "observaciones": data.observaciones.toString(),
  });
  print('=====');
  print(res.body.toString());
  print('=====');
  print('===== ${res.body.toString().contains('Invalid')}');
  if (res.body.toString().contains('Invalid')) {
    print('- entro a true false');
    return false;
  } else {
    print('- entro a false true');
    return true;
  }
}

Future<bool> insertDesastreacciones(Desastreacciones data) async {
  String theUrl = "$apiBase/insertDesastreacciones.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "cod_edan": data.codEdan.toString(),
    "accion": data.accion.toString(),
  });
  print('=====');
  print(res.body.toString());
  print('=====');
  print('===== ${res.body.toString().contains('Invalid')}');
  if (res.body.toString().contains('Invalid')) {
    print('- entro a true false');
    return false;
  } else {
    print('- entro a false true');
    return true;
  }
}

Future<bool> insertDesastreacciones2(Desastreacciones2 data) async {
  String theUrl = "$apiBase/insertDesastreacciones2.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "cod_edan": data.codEdan.toString(),
    "accion": data.accion.toString(),
  });
  print('=====');
  print(res.body.toString());
  print('=====');
  print('===== ${res.body.toString().contains('Invalid')}');
  if (res.body.toString().contains('Invalid')) {
    print('- entro a true false');
    return false;
  } else {
    print('- entro a false true');
    return true;
  }
}

Future<bool> insertDesastrerequerimientos(Desastrerequerimientos data) async {
  String theUrl = "$apiBase/insertDesastrerequerimientos.php";
  var res = await http.post(Uri.parse(theUrl), headers: {
    "Accept": "application/json"
  }, body: {
    "codrequerimientos": data.codrequerimientos.toString(),
    "cod_edan": data.codEdan.toString(),
    "requerimiento": data.requerimiento.toString(),
    "cantidad": data.cantidad.toString(),
    "prioridad": data.prioridad.toString(),
    "observaciones": data.observaciones.toString(),
  });
  print('=====');
  print(res.body.toString());
  print('=====');
  print('===== ${res.body.toString().contains('Invalid')}');
  if (res.body.toString().contains('Invalid')) {
    print('- entro a true false');
    return false;
  } else {
    print('- entro a false true');
    return true;
  }
}
