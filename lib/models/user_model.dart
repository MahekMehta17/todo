class User {
  String name;
  String email;
  String? profilePicture;

  User({
    required this.name,
    required this.email,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profilePicture': profilePicture,
      };
}
