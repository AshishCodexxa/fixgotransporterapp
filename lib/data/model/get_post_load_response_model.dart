class GetPostLoadResponseModel {
  bool? success;
  String? data;
  String? message;

  GetPostLoadResponseModel({this.success, this.data, this.message});

  GetPostLoadResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}