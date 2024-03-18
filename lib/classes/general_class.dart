class GeneralResponse {
  final int code;
  final String message;
  final String response;

  const GeneralResponse({
    required this.code,
    required this.message,
    required this.response
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'code': int code,
        'message': String message,
        'response': String response
      } =>
      GeneralResponse(
        code: code,
        message: message,
        response: response
      ),
      _ => throw const FormatException('Failed to load password'),
    };
  }
}