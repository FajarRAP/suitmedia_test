class User {
  final String email;
  final String name;
  final String avatar;

  User({
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        name: '${json['first_name']} ${json['last_name']}',
        avatar: json['avatar'],
      );
}
