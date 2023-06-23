

class ApiConstants {

  String baseUrl = "http://170.64.186.168:5005/api/v1/";

  String uploadImageUrl = "http://170.64.186.168:5005/api/v1/file/detail/";


/////////////////////// User Authentication Api ////////////////////////////////


  String loginUrl = "user/login";
  String verifyOtpUrl = "user/verify-otp-login";
  String userProfile = "user/current";
  String userEditProfile = "user/edit-profile";


/////////////////////// Company Pick Up Address Api ////////////////////////////


  String allPickUpAddress = "pickup/?limit=5";
  String createPickUpAddress = "pickup/";



/////////////////////// Company Post Api ///////////////////////////////////////


  String createCompanyPost = "post/";
  String companyAllPost = "post/?status=";
  String companyPostImagesUpload = "file";



}