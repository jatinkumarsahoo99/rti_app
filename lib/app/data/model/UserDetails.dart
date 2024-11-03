class UserDetails{
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final String country;
  final String state;
  final String pin;
  final String role;

  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.address,
    required this.country,
    required this.state,
    required this.pin,
    required this.role,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      pin: json['pin'] ?? '',
      role: json['role'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'gender': gender,
      'address': address,
      'country': country,
      'state': state,
      'pin': pin,
      'role': role,
    };
  }
}