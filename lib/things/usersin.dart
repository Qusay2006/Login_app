class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final String country;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      email: json['email'],
      phone: json['phone'],
      image: json['picture']['large'],
      country: json['location']['country'],
    );
  }
}