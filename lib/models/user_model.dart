class UserModel {
      final String uid;
        final String name;
          final String phoneNumber;
            final String role;
              final String? fcmToken;

                UserModel({
                    required this.uid,
                        required this.name,
                            required this.phoneNumber,
                                required this.role,
                                    this.fcmToken,
                                      });

                                        Map<String, dynamic> toMap() {
                                            return {
                                                  'uid': uid,
                                                        'name': name,
                                                              'phoneNumber': phoneNumber,
                                                                    'role': role,
                                                                          'fcmToken': fcmToken,
                                                                              };
                                                                                }

                                                                                  factory UserModel.fromMap(Map<String, dynamic> map) {
                                                                                      return UserModel(
                                                                                            uid: map['uid'] ?? '',
                                                                                                  name: map['name'] ?? '',
                                                                                                        phoneNumber: map['phoneNumber'] ?? '',
                                                                                                              role: map['role'] ?? 'house_owner',
                                                                                                                    fcmToken: map['fcmToken'],
                                                                                                                        );
                                                                                                                          }
                                                                                                                          }class UserModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String role;
  final String? fcmToken;

  UserModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.role,
    this.fcmToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'role': role,
      'fcmToken': fcmToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      pho
}