class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profileUrl;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.profileUrl,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profileUrl = json['profileUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['profileUrl'] = profileUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
