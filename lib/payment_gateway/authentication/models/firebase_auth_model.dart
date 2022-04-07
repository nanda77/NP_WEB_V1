
class FirebaseAuthModel {
  FirebaseAuthModel({
    this.status,
    this.fromEmailLogin,
    this.sendOtp,
    this.verifyOtp,
    this.googleLogin,
    this.userExist,
    this.message,
    this.verificationId,});

  FirebaseAuthModel.fromJson(dynamic json) {
    status = json['status'];
    fromEmailLogin = json['fromEmailLogin'];
    sendOtp = json['sendOtp'];
    verifyOtp = json['verifyOtp'];
    googleLogin = json['googleLogin'];
    userExist = json['userExist'];
    message = json['message'];
    verificationId = json['verificationId'];
  }
  bool? status;
  bool? fromEmailLogin;
  bool? sendOtp = false;
  bool? verifyOtp = false;
  bool? googleLogin = false;
  bool? userExist;
  String? message;
  String? verificationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['fromEmailLogin'] = fromEmailLogin;
    map['sendOtp'] = sendOtp;
    map['verifyOtp'] = verifyOtp;
    map['googleLogin'] = googleLogin;
    map['userExist'] = userExist;
    map['message'] = message;
    map['verificationId'] = verificationId;
    return map;
  }

}
