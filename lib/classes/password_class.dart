class Password {
  final String password;

  const Password({
    required this.password
  });

  factory Password.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'password': String password
      } =>
        Password(
          password: password
        ),
      _ => throw const FormatException('Failed to load password'),
    };
  }
}