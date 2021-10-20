// ignore_for_file: unnecessary_string_escapes

List<String> listqueryDataBase = [
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
  """CREATE TABLE IF NOT EXISTS edan (
cod_edan INTEGER PRIMARY KEY AUTOINCREMENT ,
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
viviendas INTEGER DEFAULT NULL,
familias INTEGER DEFAULT NULL,
agua TEXT DEFAULT NULL,
basura TEXT DEFAULT NULL,
alcantarillado TEXT DEFAULT NULL,
electricidad TEXT DEFAULT NULL,
telecom TEXT DEFAULT NULL,
transporte TEXT DEFAULT NULL,
heridos INTEGER DEFAULT NULL,
muertos INTEGER DEFAULT NULL,
desaparecidos INTEGER DEFAULT NULL,
acciones_prioritarias mediumtext,
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
  """CREATE TABLE IF NOT EXISTS personalsalud (
codpersonal INTEGER PRIMARY KEY AUTOINCREMENT ,
tipopersonal TEXT DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS requiereapoyo (
codrequeri TEXT NOT NULL PRIMARY KEY ,
nomrequeri TEXT DEFAULT NULL
)""",
  """CREATE TABLE IF NOT EXISTS todos_anterior_redu (
Codigo TEXT DEFAULT NULL,
Departamento TEXT DEFAULT NULL,
Municipio TEXT DEFAULT NULL,
Comunidad TEXT DEFAULT NULL,
Establecimiento TEXT DEFAULT NULL
)"""
];
