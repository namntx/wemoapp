class Client {
  final String id;
  final String fullName;
  final String addR;
  final String numPhone;

  Client({this.id, this.fullName, this.addR, this.numPhone});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      addR: json['addr'] as String,
      numPhone: json['phone'] as String
    );
  }
}