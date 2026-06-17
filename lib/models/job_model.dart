class JobPost {
      final String jobId;
        final String postedBy;
          final String title;
            final String description;
              final String category;
                final String locationAddress;
                  final double budget;
                    final String duration;
                      final String status;
                        final List<String> applicants;

                          JobPost({
                              required this.jobId,
                                  required this.postedBy,
                                      required this.title,
                                          required this.description,
                                              required this.category,
                                                  required this.locationAddress,
                                                      required this.budget,
                                                          required this.duration,
                                                              required this.status,
                                                                  required this.applicants,
                                                                    });

                                                                      Map<String, dynamic> toMap() {
                                                                          return {
                                                                                'jobId': jobId,
                                                                                      'postedBy': postedBy,
                                                                                            'title': title,
                                                                                                  'description': description,
                                                                                                        'category': category,
                                                                                                              'locationAddress': locationAddress,
                                                                                                                    'budget': budget,
                                                                                                                          'duration': duration,
                                                                                                                                'status': status,
                                                                                                                                      'applicants': applicants,
                                                                                                                                          };
                                                                                                                                            }

                                                                                                                                              factory JobPost.fromMap(Map<String, dynamic> map) {
                                                                                                                                                  return JobPost(
                                                                                                                                                        jobId: map['jobId'] ?? '',
                                                                                                                                                              postedBy: map['postedBy'] ?? '',
                                                                                                                                                                    title: map['title'] ?? '',
                                                                                                                                                                          description: map['description'] ?? '',
                                                                                                                                                                                category: map['category'] ?? '',
                                                                                                                                                                                      locationAddress: map['locationAddress'] ?? '',
                                                                                                                                                                                            budget: (map['budget'] as num?)?.toDouble() ?? 0.0,
                                                                                                                                                                                                  duration: map['duration'] ?? '',
                                                                                                                                                                                                        status: map['status'] ?? 'open',
                                                                                                                                                                                                              applicants: List<String>.from(map['applicants'] ?? []),
                                                                                                                                                                                                                  );
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                    }class JobPost {
  final String jobId;
  final String postedBy;
  final String title;
  final String description;
  final String category;
  final String locationAddress;
  final double budget;
  final String duration;
  final String status;
  final List<String> applicants;

  JobPost({
    required this.jobId,
    required this.postedBy,
    required this.title,
    required this.description,
    required this.category,
    required this.locationAddress,
    required this.budget,
    required this.duration,
    required this.status,
    required this.applicants,
  });

  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'postedBy': postedBy,
      'title': title,
      'description': description,
      'category': category,
      'locationAddress': locationAddress,
      'budget': budget,
      'duration': duration,
      'status': status,
      'applicants': applicants,
    };
  }

  factory JobPost.fromMap(Map<String, dynamic> map) {
    return JobPost(
      jobId: map['jobId'] ?? '',
      postedBy: map['postedBy'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      locationAddress: map['locationAddress'] ?? '
}