class User {
  final String name;
  final String email;
  final String phone;
  final String imageUrl;
  final String fullAddress;
  final Gender gender;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.fullAddress,
    required this.gender,
  });

  @override
  String toString() {
    return 'User{name: $name, email: $email, phone: $phone, imageUrl: $imageUrl, fullAddress: $fullAddress, gender: $gender}';
  }
}

enum Gender { male, female }
