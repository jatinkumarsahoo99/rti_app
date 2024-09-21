class NewApplicationStatusInfo {
  final String registrationNo;
  final String firstName;
  final String lastName;
  final String department;
  final String applicationStatus;
  final String applicationStatusUpdated;

  NewApplicationStatusInfo(
      {required this.registrationNo,
      required this.firstName,
      required this.lastName,
      required this.department,
      required this.applicationStatus,
      required this.applicationStatusUpdated,});

  Map<String, String> toMap() {
    return {
      'Registration No': registrationNo,
      'First Name': firstName,
      'Last Name': lastName,
      'Department': department,
      'Application Status': applicationStatus,
      'Status Updated': applicationStatusUpdated,
    };
  }
}
