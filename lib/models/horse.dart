class Horses {
  final String username;
  final String password;
  final String email;
  String photo;
  final String phoneNumber;
  final int age;
  final String link;
  final bool isAdmin;
  final bool isDP;

  Horses({
    required this.username,
    required this.password,
    required this.email,
    required this.photo, // This property is not final now
    this.phoneNumber = '',
    this.age = 0,
    this.link = '',
    this.isAdmin = false,
    this.isDP = false,
  });
}
