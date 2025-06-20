class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Ingresa un email válido';

    final regExpr = RegExp(
      r"^[Aa-z-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (regExpr.hasMatch(email)) {
      return null;
    } else {
      return 'Correo no válido';
    }
  }

  // Agregar validación para la contraseña

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty)
      return 'Ingresa una contraseña válida';

    // Validar que la contraseña tenga al menos 6 caracteres, una mayúscula, una minúscula y un número
    final regExpr = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$');

    if (regExpr.hasMatch(password)) {
      return null;
    } else {
      return 'La contraseña debe tener al menos 6 caracteres, una mayúscula, una minúscula y un número';
    }
  }

  /// Validación para el nombre
  ///
  /// Verifica que el nombre tenga como minímo 2 caracteres
  static String? validateName(String? name) {
    if (name == null || name.isEmpty || name.length < 2) {
      return 'Ingresa un nombre válido';
    }
    return null;
  }
}
