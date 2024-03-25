class ExactBody{
  final int uppercase;
  final int lowercase;
  final int digits;
  final int special_characters;

  const ExactBody({
    required this.uppercase,
    required this.lowercase,
    required this.digits,
    required this.special_characters
  });

  factory ExactBody.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'uppercase': int uppercase,
        'lowercase': int lowercase,
        'digits': int digits,
        'special_characters': int special_characters
      } =>
      ExactBody(uppercase: uppercase, lowercase: lowercase, digits: digits, special_characters: special_characters),
      _ => throw const FormatException('Failed to load password')
    };
  }
}