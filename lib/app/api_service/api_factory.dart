class ApiFactory{

  static String baseUrl = "https://rti.telangana.gov.in/api/api";

  static var baseUrlAccount = "$baseUrl/Account";

  static String logInUrl = "$baseUrlAccount/GetToken";
  static String registerUrl = "$baseUrlAccount/Register";

  static var baseUrlApplication = "$baseUrl/Application";
  static var baseUrlDashBoard = "$baseUrl/Dashboard";
  static var baseUrlContact = "$baseUrl/Contact";
  static var baseUrlFirstAppeal = "$baseUrl/FirstAppeal";

  static String userDetails = "$baseUrlDashBoard/UserDetails";
  static String totalSubmittedApplicationsUrl = "$baseUrlDashBoard/SubmittedCount";
  static String totalFirstAppealsSubmittedUrl = "$baseUrlDashBoard/FASubmittedCount";
  static String totalDisposedApplicationsUrl = "$baseUrlDashBoard/DisposedCount";
  static String totalFirstAppealsDisposedUrl = "$baseUrlDashBoard/FADisposedCount";
  static String totalDeemedApplicationsUrl = "$baseUrlDashBoard/DeemedCount";
  static String totalFirstAppealsDeemedUrl = "$baseUrlDashBoard/FADeemedCount";
  static String totalRejectedApplicationsUrl = "$baseUrlDashBoard/RejectedCount";
  static String totalFirstAppealsRejectedUrl = "$baseUrlDashBoard/FARejectedCount";
  static String getAllApplications = "$baseUrlApplication/GetAll";
  static String statusCount = "$baseUrlDashBoard/StatusCount";
  static String faCount = "$baseUrlDashBoard/FACount";

  static String apiToken = "";
}
