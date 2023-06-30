class GetAllPickUpAddressList {
  GetAllPickUpAddressList({
    required this.success,
    required this.data,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final Data data;
  late final String message;
  late final Payload payload;

  GetAllPickUpAddressList.fromJson(Map<String, dynamic> json){
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
    required this.docs,
    required this.totalDocs,
    required this.offset,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });
  late final List<Docs> docs;
  late final int totalDocs;
  late final int offset;
  late final int limit;
  late final int totalPages;
  late final int page;
  late final int pagingCounter;
  late final bool hasPrevPage;
  late final bool hasNextPage;
  late final Null prevPage;
  late final Null nextPage;

  Data.fromJson(Map<String, dynamic> json){
    docs = List.from(json['docs']).map((e)=>Docs.fromJson(e)).toList();
    totalDocs = json['totalDocs'];
    offset = json['offset'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    page = json['page'];
    pagingCounter = json['pagingCounter'];
    hasPrevPage = json['hasPrevPage'];
    hasNextPage = json['hasNextPage'];
    prevPage = null;
    nextPage = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['docs'] = docs.map((e)=>e.toJson()).toList();
    _data['totalDocs'] = totalDocs;
    _data['offset'] = offset;
    _data['limit'] = limit;
    _data['totalPages'] = totalPages;
    _data['page'] = page;
    _data['pagingCounter'] = pagingCounter;
    _data['hasPrevPage'] = hasPrevPage;
    _data['hasNextPage'] = hasNextPage;
    _data['prevPage'] = prevPage;
    _data['nextPage'] = nextPage;
    return _data;
  }
}

class Docs {
  Docs({
    required this.address,
    required this.id,
    required this.name,
    required this.phone,
    required this.geo,
  });
  late final Address address;
  late final String id;
  late final String name;
  late final String phone;
  late final Geo geo;

  Docs.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address']);
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    geo = Geo.fromJson(json['geo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    _data['_id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['geo'] = geo.toJson();
    return _data;
  }
}

class Address {
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.district,
    required this.laneNumber,
  });
  late final String street;
  late final String city;
  late final String state;
  late final String country;
  late final String postalCode;
  late final String district;
  late final String laneNumber;

  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postalCode'];
    district = json['district'];
    laneNumber = json['laneNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['city'] = city;
    _data['state'] = state;
    _data['country'] = country;
    _data['postalCode'] = postalCode;
    _data['district'] = district;
    _data['laneNumber'] = laneNumber;
    return _data;
  }
}

class Geo {
  Geo({
    required this.type,
    required this.address,
    required this.coordinates,
    required this.id,
  });
  late final String type;
  late final String address;
  late final List<double> coordinates;
  late final String id;

  Geo.fromJson(Map<String, dynamic> json){
    type = json['type'];
    address = json['address'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['address'] = address;
    _data['coordinates'] = coordinates;
    _data['_id'] = id;
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