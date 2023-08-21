// ignore_for_file: unnecessary_string_escapes

List<String> listqueryDataBase = [
  """CREATE TABLE IF NOT EXISTS danospersonaldesalud (
codpersalud INTEGER PRIMARY KEY AUTOINCREMENT,
cod_edan INTEGER DEFAULT NULL,
personal TEXT DEFAULT NULL,
muertos INTEGER DEFAULT NULL,
heridos INTEGER DEFAULT NULL,
enfermos INTEGER DEFAULT NULL,
disponibles INTEGER DEFAULT NULL,
desaparecidos INTEGER DEFAULT NULL,
observaciones TEXT DEFAULT NULL
);""",
  """CREATE TABLE IF NOT EXISTS desastreacciones (
cod_edan INTEGER DEFAULT NULL,
accion TEXT DEFAULT NULL
);""",
  """CREATE TABLE IF NOT EXISTS desastreacciones2 (
cod_edan INTEGER DEFAULT NULL,
accion TEXT DEFAULT NULL
);""",
  """CREATE TABLE IF NOT EXISTS desastreestablecimiento (
coddesastreestablecimiento INTEGER PRIMARY KEY AUTOINCREMENT,
cod_edan INTEGER DEFAULT NULL,
nomestablecimiento TEXT DEFAULT NULL,
funciona TEXT DEFAULT NULL,
tieneagua TEXT DEFAULT NULL,
area_afectada TEXT DEFAULT NULL
);""",
  """CREATE TABLE IF NOT EXISTS desastrerequerimientos (
codrequerimientos INTEGER PRIMARY KEY AUTOINCREMENT,
cod_edan INTEGER DEFAULT NULL,
requerimiento TEXT DEFAULT NULL,
cantidad INTEGER DEFAULT NULL,
prioridad TEXT DEFAULT NULL,
observaciones text
);""",
  """CREATE TABLE IF NOT EXISTS evento (
codevento INTEGER PRIMARY KEY AUTOINCREMENT ,
nomevento TEXT DEFAULT NULL,
snis TEXT DEFAULT NULL,
num_snis INTEGER DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS lista_sintomas (
cod_sintoma INTEGER PRIMARY KEY AUTOINCREMENT ,
codigo_sintoma TEXT DEFAULT NULL,
sintoma TEXT DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS mov_pers_salud (
personal_salud TEXT DEFAULT NULL,
cantidad INTEGER DEFAULT NULL,
cod_edan INTEGER DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS usuarios (
usuario_id INTEGER PRIMARY KEY AUTOINCREMENT ,
nombre_completo TEXT DEFAULT NULL,
cargo TEXT DEFAULT NULL,
email TEXT DEFAULT NULL,
contraseña TEXT DEFAULT NULL,
nivel_usuario INTEGER DEFAULT NULL,
usuario TEXT DEFAULT NULL,
activado TEXT  DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS nivel_usuarios (
userlevelid INTEGER PRIMARY KEY AUTOINCREMENT ,
userlevelname TEXT NOT NULL
)""",
  """CREATE TABLE IF NOT EXISTS edan (
cod_edan INTEGER PRIMARY KEY AUTOINCREMENT ,
tipo_edan TEXT DEFAULT NULL,
evento TEXT DEFAULT NULL,
clase_evento TEXT DEFAULT NULL,
fecha date DEFAULT NULL,
hora time DEFAULT NULL,
continua TEXT DEFAULT NULL,
nombre TEXT DEFAULT NULL,
cargo TEXT DEFAULT NULL,
dreccion TEXT DEFAULT NULL,
tel_fc TEXT DEFAULT NULL,
tel_cc TEXT DEFAULT NULL,
depto TEXT DEFAULT NULL,
municipio TEXT DEFAULT NULL,
comunidad TEXT DEFAULT NULL,
tiene_coord TEXT DEFAULT NULL,
coordenada_x TEXT DEFAULT NULL,
coordenada_y TEXT DEFAULT NULL,
aereo TEXT DEFAULT NULL,
terrestre TEXT DEFAULT NULL,
fluvial TEXT DEFAULT NULL,
ferroviario TEXT DEFAULT NULL,
partida TEXT DEFAULT NULL,
hora_llegada TEXT DEFAULT NULL,
clima TEXT DEFAULT NULL,
medio_comunicacion TEXT DEFAULT NULL,
canal TEXT DEFAULT NULL,
nombre_emisora TEXT DEFAULT NULL,
dial_emisora TEXT DEFAULT NULL,
telefono_emisora TEXT DEFAULT NULL,
viviendas INTEGER DEFAULT NULL,
familias INTEGER DEFAULT NULL,
ninios INTEGER DEFAULT NULL,
ninias INTEGER DEFAULT NULL,
discapacidad INTEGER DEFAULT NULL,
discapacidadm INTEGER DEFAULT NULL,
embarazadas INTEGER DEFAULT NULL,
adulto_mayor INTEGER DEFAULT NULL,
adulto_mayorm INTEGER DEFAULT NULL,
num_albergues INTEGER DEFAULT NULL,
agua TEXT DEFAULT NULL,
basura TEXT DEFAULT NULL,
alcantarillado TEXT DEFAULT NULL,
electricidad TEXT DEFAULT NULL,
telecom TEXT DEFAULT NULL,
transporte TEXT DEFAULT NULL,
establecimientossalud TEXT DEFAULT NULL,
heridos INTEGER DEFAULT NULL,
muertos INTEGER DEFAULT NULL,
desaparecidos INTEGER DEFAULT NULL,
lesionados INTEGER DEFAULT NULL,
otra_organizacion TEXT DEFAULT NULL,
sci TEXT DEFAULT NULL,
sci_donde TEXT DEFAULT NULL,
lugar_lle TEXT DEFAULT NULL,
fecha_lle date DEFAULT NULL,
hora_lle time DEFAULT NULL,
responsable_lle TEXT DEFAULT NULL,
cargo_lle TEXT DEFAULT NULL,
telf_fijo_lle TEXT DEFAULT NULL,
telf_cel_lle TEXT DEFAULT NULL,
email TEXT DEFAULT NULL,
usuario TEXT DEFAULT NULL,
fechap date DEFAULT NULL,
enviado TEXT DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS establecimientos (
departamentos TEXT DEFAULT NULL,
municipios TEXT DEFAULT NULL,
comuidades TEXT DEFAULT NULL,
establecimientos TEXT DEFAULT NULL
);""",
  """CREATE TABLE IF NOT EXISTS personalsalud (
codpersonal INTEGER PRIMARY KEY AUTOINCREMENT ,
tipopersonal TEXT DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS requiereapoyo (
codrequeri TEXT NOT NULL PRIMARY KEY ,
nomrequeri TEXT DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS todos_anterior_redu (
cod_table INTEGER PRIMARY KEY AUTOINCREMENT ,
Codigo TEXT DEFAULT NULL,
Departamento TEXT DEFAULT NULL,
Municipio TEXT DEFAULT NULL,
Comunidad TEXT DEFAULT NULL,
Establecimiento TEXT DEFAULT NULL,
coordenada_x TEXT NULL,
coordenada_y TEXT NULL
)""",

  """
CREATE TABLE IF NOT EXISTS planilla_atencion (
usuario TEXT DEFAULT NULL,
cod_planilla INTEGER PRIMARY KEY AUTOINCREMENT,
cod_edan INTEGER DEFAULT NULL,
depto TEXT DEFAULT NULL,
municipio TEXT DEFAULT NULL,
comunidad TEXT DEFAULT NULL,
nomestablecimiento TEXT  DEFAULT NULL,
gerencia_red TEXT DEFAULT NULL,
poblacion INTEGER DEFAULT NULL,
fecha date DEFAULT NULL,
hora time DEFAULT NULL,
evento TEXT DEFAULT NULL,
nombre_responsable TEXT DEFAULT NULL,
cargo_responsable TEXT DEFAULT NULL,
telf_responsable TEXT DEFAULT NULL,
enviado TEXT DEFAULT NULL
);
""",
  """
CREATE TABLE IF NOT EXISTS planilla_detalle (
cod_detalle INTEGER PRIMARY KEY AUTOINCREMENT,
cod_planilla INTEGER DEFAULT NULL,
edad INTEGER DEFAULT NULL,
sexo TEXT DEFAULT NULL,
diagnostico TEXT DEFAULT NULL,
cantidad INTEGER DEFAULT NULL
);
"""
];
