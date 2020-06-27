class User {
  int id;
  String firstname;
  String lastname;
  String email;
  String password;
  String bithdate;
  String profiletype;
  String description;
  String category;

  User(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.password,
      this.bithdate,
      this.category,
      this.description,
      this.profiletype});

  User.map(dynamic obj) {
    this.id = obj['id'];
    this.firstname = obj['firstname'];
    this.lastname = obj['lastname'];
    this.email = obj['email'];
    this.password = obj['password'];
    this.bithdate = obj['birthdate'];
    this.category = obj['category'];
    this.description = obj['description'];
    this.profiletype = obj['profiletype'];
  }

  String get textbirthdate {
    return this.bithdate.toString();
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id.toString();
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    map["email"] = email;
    map['password'] = password;
    map['bithdate'] = bithdate;
    map['category'] = category;
    map['description'] = description;
    map['profiletype'] = profiletype;
    return map;
  }
}
