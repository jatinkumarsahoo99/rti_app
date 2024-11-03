class ApiFactory{

  static String baseUrl = "https://rti.telangana.gov.in/api/api/";
  static String logInUrl = "${baseUrl}Account/GetToken";
  static String registerUrl = "${baseUrl}Account/Register";
  static String userDetails = "${baseUrl}Application/UserDetails";
  static String totalSubmittedApplicationsUrl = "${baseUrl}Application/SubmittedCount";
  static String totalFirstAppealsSubmittedUrl = "${baseUrl}Application/FASubmittedCount";
  static String totalDisposedApplicationsUrl = "${baseUrl}Application/DisposedCount";
  static String totalFirstAppealsDisposedUrl = "${baseUrl}Application/FADisposedCount";
  static String totalDeemedApplicationsUrl = "${baseUrl}Application/DeemedCount";
  static String totalFirstAppealsDeemedUrl = "${baseUrl}Application/FADeemedCount";
  static String totalRejectedApplicationsUrl = "${baseUrl}Application/RejectedCount";
  static String totalFirstAppealsRejectedUrl = "${baseUrl}Application/FARejectedCount";
}