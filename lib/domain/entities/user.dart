class User{
  final int id;
  final String fullName;
  final String email;
  final String apiKey;
  final String createdAt;
  final String updatedAt;


  User(this.id, this.fullName, this.email, this.apiKey, this.createdAt,
      this.updatedAt);

  factory  User.fromJson(Map<String, dynamic> json){
    return new User(
      json["id"],
      json["full_name"],
      json["email"],
      json["api_key"],
      json["createdAt"],
      json["updatedAt"],
    );
  }
}