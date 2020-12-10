class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String profileImage;
  final String address;
  final String phone;
  final int gender;
  final String status;
  final String nationality;
  final String countryOfResidence;
  final String token;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.gender,
    this.status,
    this.nationality,
    this.countryOfResidence,
    this.token,
  });

  factory User.fromMap(Map<String, dynamic> info) {
    return User(
      id: info['id'],
      firstName: info['first_name'],
      lastName: info['last_name'],
      email: info['email'],
      profileImage: info['image'],
      address: info['address'],
      phone: info['phone'],
      gender: int.tryParse(info['gender']),
      status: info['status'],
      nationality: info['nationality'],
      countryOfResidence: info['country_of_residence'],
      token: info['token'],
    );
  }
}
