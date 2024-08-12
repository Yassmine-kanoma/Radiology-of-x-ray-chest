
class UserModel  {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;


  const UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.address,
    required this.lastName,
    required this.firstName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        address: json['address'] as String,
    firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'address': address,
        'phone': phone,
        'first_name': firstName,
        'last_name': lastName,
      };

}
