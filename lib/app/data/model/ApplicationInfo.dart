class ApplicationInfo {
  int? applicationId;
  String? appLevel;
  String? createdOn;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? department;
  String? hod;
  String? district;
  String? status;
  String? statusUpdate;
  String? registrationNumber;
  bool? isAppealButtonVisible;

  ApplicationInfo(
      {this.applicationId,
        this.appLevel,
        this.createdOn,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.department,
        this.hod,
        this.district,
        this.status,
        this.statusUpdate,
        this.registrationNumber,
        this.isAppealButtonVisible});

  ApplicationInfo.fromJson(Map<String, dynamic> json) {
    applicationId = json['applicationId'];
    appLevel = json['appLevel'];
    createdOn = json['createdOn'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    department = json['department'];
    hod = json['hod'];
    district = json['district'];
    status = json['status'];
    statusUpdate = json['statusUpdate'];
    registrationNumber = json['registrationNumber'];
    isAppealButtonVisible = json['isAppealButtonVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationId'] = this.applicationId;
    data['appLevel'] = this.appLevel;
    data['createdOn'] = this.createdOn;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['department'] = this.department;
    data['hod'] = this.hod;
    data['district'] = this.district;
    data['status'] = this.status;
    data['statusUpdate'] = this.statusUpdate;
    data['registrationNumber'] = this.registrationNumber;
    data['isAppealButtonVisible'] = this.isAppealButtonVisible;
    return data;
  }
}