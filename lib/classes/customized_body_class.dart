class CustomizedBody {
  final int len;
  final int letters;
  final int digits;
  final int special_characters;

  const CustomizedBody({
    required this.len,
    required this.letters,
    required this.digits,
    required this.special_characters
  });

  factory CustomizedBody.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'len': int len,
        'letters': int letters,
        'digits': int digits,
        'special_characters': int special_characters
      } =>
      CustomizedBody(
        len: len,
        letters: letters,
        digits: digits,
        special_characters: special_characters
      ),
      _ => throw const FormatException('Failed to load password')
    };
  }
}