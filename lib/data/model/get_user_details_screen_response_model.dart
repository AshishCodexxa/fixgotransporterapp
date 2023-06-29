class GetUserDetailsResponseModel {
  GetUserDetailsResponseModel({
    required this.success,
    required this.data,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final Data data;
  late final String message;
  late final Payload payload;

  GetUserDetailsResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userType,
    required this.phone,
    required this.name,
    required this.isEmailVerified,
    required this.hasProfileSetup,
    required this.landlines,
    required this.mobiles,
    required this.companyName,
    required this.companyAddress,
    required this.gstNumber,
    required this.hasGstVerified,
    required this.tinNumber,
    required this.licenseNumber,
    required this.licenseImage,
    required this.panNumber,
    required this.aadharIDNumber,
    required this.aadharIDImage,
    required this.hasIdVerified,
    required this.rating,
    required this.fcmToken,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.lastPostAddedOn,
    required this.email,
  });
  late final String id;
  late final String userType;
  late final String phone;
  late final String name;
  late final bool isEmailVerified;
  late final bool hasProfileSetup;
  late final List<String> landlines;
  late final List<String> mobiles;
  late final String companyName;
  late final String companyAddress;
  late final String gstNumber;
  late final bool hasGstVerified;
  late final String tinNumber;
  late final String licenseNumber;
  late final String licenseImage;
  late final String panNumber;
  late final String aadharIDNumber;
  late final String aadharIDImage;
  late final bool hasIdVerified;
  late final Rating rating;
  late final List<dynamic> fcmToken;
  late final bool isArchived;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final String lastPostAddedOn;
  late final String email;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userType = json['userType'];
    phone = json['phone'];
    name = json['name'];
    isEmailVerified = json['isEmailVerified'];
    hasProfileSetup = json['hasProfileSetup'];
    landlines = List.castFrom<dynamic, String>(json['landlines']);
    mobiles = List.castFrom<dynamic, String>(json['mobiles']);
    companyName = json['companyName'];
    companyAddress = json['companyAddress'];
    gstNumber = json['gstNumber'];
    hasGstVerified = json['hasGstVerified'];
    tinNumber = json['tinNumber'];
    licenseNumber = json['licenseNumber'];
    licenseImage = json['licenseImage'];
    panNumber = json['panNumber'];
    aadharIDNumber = json['aadharIDNumber'];
    aadharIDImage = json['aadharIDImage'];
    hasIdVerified = json['hasIdVerified'];
    rating = Rating.fromJson(json['rating']);
    fcmToken = List.castFrom<dynamic, dynamic>(json['fcmToken']);
    isArchived = json['isArchived'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    lastPostAddedOn = json['lastPostAddedOn'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['userType'] = userType;
    _data['phone'] = phone;
    _data['name'] = name;
    _data['isEmailVerified'] = isEmailVerified;
    _data['hasProfileSetup'] = hasProfileSetup;
    _data['landlines'] = landlines;
    _data['mobiles'] = mobiles;
    _data['companyName'] = companyName;
    _data['companyAddress'] = companyAddress;
    _data['gstNumber'] = gstNumber;
    _data['hasGstVerified'] = hasGstVerified;
    _data['tinNumber'] = tinNumber;
    _data['licenseNumber'] = licenseNumber;
    _data['licenseImage'] = licenseImage;
    _data['panNumber'] = panNumber;
    _data['aadharIDNumber'] = aadharIDNumber;
    _data['aadharIDImage'] = aadharIDImage;
    _data['hasIdVerified'] = hasIdVerified;
    _data['rating'] = rating.toJson();
    _data['fcmToken'] = fcmToken;
    _data['isArchived'] = isArchived;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['lastPostAddedOn'] = lastPostAddedOn;
    _data['email'] = email;
    return _data;
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.total,
  });
  late final int rate;
  late final int total;

  Rating.fromJson(Map<String, dynamic> json){
    rate = json['rate'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rate'] = rate;
    _data['total'] = total;
    return _data;
  }
}

class Payload {
  Payload();

  Payload.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}