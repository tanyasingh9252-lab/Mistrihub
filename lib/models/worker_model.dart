class WorkerProfile {
      final String userId;
        final String name;
          final String phoneNumber;
            final String profilePhoto;
              final String village;
                final String city;
                  final String district;
                    final String state;
                      final String category;
                        final int experience;
                          final double rate;
                            final String rateType;
                              final String availability; 
                                final DateTime? availableFrom;
                                  final bool isVerified;
                                    final double rating;
                                      final List<String> gallery;

                                        WorkerProfile({
                                            required this.userId,
                                                required this.name,
                                                    required this.phoneNumber,
                                                        required this.profilePhoto,
                                                            required this.village,
                                                                required this.city,
                                                                    required this.district,
                                                                        required this.state,
                                                                            required this.category,
                                                                                required this.experience,
                                                                                    required this.rate,
                                                                                        required this.rateType,
                                                                                            required this.availability,
                                                                                                this.availableFrom,
                                                                                                    required this.isVerified,
                                                                                                        required this.rating,
                                                                                                            required this.gallery,
                                                                                                              });

                                                                                                                Map<String, dynamic> toMap() {
                                                                                                                    return {
                                                                                                                          'userId': userId,
                                                                                                                                'name': name,
                                                                                                                                      'phoneNumber': phoneNumber,
                                                                                                                                            'profilePhoto': profilePhoto,
                                                                                                                                                  'village': village,
                                                                                                                                                        'city': city,
                                                                                                                                                              'district': district,
                                                                                                                                                                    'state': state,
                                                                                                                                                                          'category': category,
                                                                                                                                                                                'experience': experience,
                                                                                                                                                                                      'rate': rate,
                                                                                                                                                                                            'rateType': rateType,
                                                                                                                                                                                                  'availability': availability,
                                                                                                                                                                                                        'availableFrom': availableFrom?.toIso8601String(),
                                                                                                                                                                                                              'isVerified': isVerified,
                                                                                                                                                                                                                    'rating': rating,
                                                                                                                                                                                                                          'gallery': gallery,
                                                                                                                                                                                                                              };
                                                                                                                                                                                                                                }

                                                                                                                                                                                                                                  factory WorkerProfile.fromMap(Map<String, dynamic> map) {
                                                                                                                                                                                                                                      return WorkerProfile(
                                                                                                                                                                                                                                            userId: map['userId'] ?? '',
                                                                                                                                                                                                                                                  name: map['name'] ?? '',
                                                                                                                                                                                                                                                        phoneNumber: map['phoneNumber'] ?? '',
                                                                                                                                                                                                                                                              profilePhoto: map['profilePhoto'] ?? '',
                                                                                                                                                                                                                                                                    village: map['village'] ?? '',
                                                                                                                                                                                                                                                                          city: map['city'] ?? '',
                                                                                                                                                                                                                                                                                district: map['district'] ?? '',
                                                                                                                                                                                                                                                                                      state: map['state'] ?? '',
                                                                                                                                                                                                                                                                                            category: map['category'] ?? '',
                                                                                                                                                                                                                                                                                                  experience: map['experience'] ?? 0,
                                                                                                                                                                                                                                                                                                        rate: (map['rate'] as num?)?.toDouble() ?? 0.0,
                                                                                                                                                                                                                                                                                                              rateType: map['rateType'] ?? 'daily',
                                                                                                                                                                                                                                                                                                                    availability: map['availability'] ?? 'today',
                                                                                                                                                                                                                                                                                                                          availableFrom: map['availableFrom'] != null ? DateTime.parse(map['availableFrom']) : null,
                                                                                                                                                                                                                                                                                                                                isVerified: map['isVerified'] ?? false,
                                                                                                                                                                                                                                                                                                                                      rating: (map['rating'] as num?)?.toDouble() ?? 5.0,
                                                                                                                                                                                                                                                                                                                                            gallery: List<String>.from(map['gallery'] ?? []),
                                                                                                                                                                                                                                                                                                                                                );
                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                  }class WorkerProfile {
  final String userId;
  final String name;
  final String phoneNumber;
  final String profilePhoto;
  final String village;
  final String city;
  final String district;
  final String state;
  final String category;
  final int experience;
  final double rate;
  final String rateType;
  final String availability; 
  final DateTime? availableFrom;
  final bool isVerified;
  final double rating;
  final List<String> gallery;

  WorkerProfile({
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.village,
    required this.city,
    required this.district,
    required this.state,
    required this.category,
    required this.experience,
    required this.rate,
    required this.rateType,
    required this.availability,
    this.availableFrom,
    required this.isVerified,
    required this.rating,
    required this.gallery,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'phoneNumber': phoneNumber,
      'profilePhoto': profilePhoto,
      'village': village,
      'city': city,
      'district': district,
      'state': state,
      'category': category,
      'experience': experience,
      'rate': rate,
      'rateType': rateType,
      'availability': availability,
      'availableFrom': availableFrom?.toIso8601String(),
      'isVerified': isVerified,
      'rating': rating,
      'gallery': gallery,
    };
  }

  factory WorkerProfile.fromMap(Map<String, dynamic> map) {
    return WorkerProfile(
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePhoto: map['profilePhoto'] ?? '',
      village: map['village'] ?? '',
      city: map['city'] ?? '',
      district: map['district'] ?? '',
      state: map['state'] ?? '',
      category: map['category'] ?? '',
      experience: map['experience'] ?? 0,
      rate: (map['rate'] as num?)?.toDouble() ?? 0.0,
      rateType: map['rateT
}