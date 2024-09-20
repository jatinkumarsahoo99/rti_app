class FirstAppealDetailsInfo {
  final String firstAppealRegistrationNo;
  final String firstName;
  final String lastName;
  final String department;
  final String applicationStatus;
  final String applicationStatusUpdated;

  FirstAppealDetailsInfo(
      {required this.firstAppealRegistrationNo,
      required this.firstName,
      required this.lastName,
      required this.department,
      required this.applicationStatus,
      required this.applicationStatusUpdated});

  Map<String, String> toMap() {
    return {
      'First Appeal Registration No': firstAppealRegistrationNo,
      'First Name': firstName,
      'Last Name': lastName,
      'Department': department,
      'Application Status': applicationStatus,
      'Status Updated': applicationStatusUpdated
    };
  }
}
