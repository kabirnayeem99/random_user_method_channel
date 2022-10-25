class UserMethodDto {
  String? email;
  String? fullAddress;
  String? gender;
  String? imageUrl;
  String? name;
  String? phone;

  UserMethodDto(
      {this.email,
      this.fullAddress,
      this.gender,
      this.imageUrl,
      this.name,
      this.phone});

  UserMethodDto.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullAddress = json['fullAddress'];
    gender = json['gender'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullAddress'] = fullAddress;
    data['gender'] = gender;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
