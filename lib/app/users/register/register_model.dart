class RegisterModel{
  late final String fullName;
  late final String email;
  late final String password;
  late final String confirm;

  RegisterModel(this.fullName, this.email, this.password,this.confirm);

  Map<String, dynamic> toMap() => {
    "full_name": this.fullName,
    "email": this.email,
    "password": this.password,
    "confirmation_password": this.confirm
  };
}