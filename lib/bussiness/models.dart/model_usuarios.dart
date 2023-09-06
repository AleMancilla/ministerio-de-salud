class ModelUsuarios {
  int? usuarioId;
  String? nombreCompleto;
  String? cargo;
  String? email;
  String? contrasenia;
  int? nivelUsuario;
  String? usuario;
  String? activado;

  ModelUsuarios.fromMap(Map<String, dynamic> map) {
    usuarioId = map['usuario_id'];
    nombreCompleto = map['nombre_completo'];
    cargo = map['cargo'];
    email = map['email'];
    contrasenia = map['contraseña'];
    nivelUsuario = map['nivel_usuario'];
    usuario = map['usuario'];
    activado = map['activado'];
  }
}
