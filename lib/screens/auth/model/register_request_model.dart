class RegisterRequest {
  String? username;
  String? email;
  String? fname;
  String? lname;
  String? password1;
  String? password2;

  RegisterRequest(
      {this.username,
      this.email,
      this.fname,
      this.lname,
      this.password1,
      this.password2});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    fname = json['fname'];
    lname = json['lname'];
    password1 = json['password1'];
    password2 = json['password2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['fname'] = fname;
    data['lname'] = lname;
    data['password1'] = password1;
    data['password2'] = password2;
    return data;
  }
}
