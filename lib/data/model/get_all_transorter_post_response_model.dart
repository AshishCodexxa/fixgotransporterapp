// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAllTransporterPostResponseModel {
  bool? success;
  Data? data;
  String? message;


  GetAllTransporterPostResponseModel({
    this.success,
    this.data,
    this.message,
  
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'data': data?.toMap(),
      'message': message,
    
    };
  }

  factory GetAllTransporterPostResponseModel.fromMap(Map<String, dynamic> map) {
    return GetAllTransporterPostResponseModel(
      success: map['success'] != null ? map['success'] as bool : null,
      data: map['data'] != null ? Data.fromMap(map['data'] as Map<String,dynamic>) : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllTransporterPostResponseModel.fromJson(String source) => GetAllTransporterPostResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Data {
  List<Doc>? docs;
  int? totalDocs;
  int? offset;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  Data({
    this.docs,
    this.totalDocs,
    this.offset,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docs': docs?.map((x) => x.toMap()).toList(),
      'totalDocs': totalDocs,
      'offset': offset,
      'limit': limit,
      'totalPages': totalPages,
      'page': page,
      'pagingCounter': pagingCounter,
      'hasPrevPage': hasPrevPage,
      'hasNextPage': hasNextPage,
      'prevPage': prevPage,
      'nextPage': nextPage,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      docs: map['docs'] != null ? List<Doc>.from((map['docs'] as List<dynamic>).map<Doc?>((x) => Doc.fromMap(x as Map<String,dynamic>),),) : null,
      totalDocs: map['totalDocs'] != null ? map['totalDocs'] as int : null,
      offset: map['offset'] != null ? map['offset'] as int : null,
      limit: map['limit'] != null ? map['limit'] as int : null,
      totalPages: map['totalPages'] != null ? map['totalPages'] as int : null,
      page: map['page'] != null ? map['page'] as int : null,
      pagingCounter: map['pagingCounter'] != null ? map['pagingCounter'] as int : null,
      hasPrevPage: map['hasPrevPage'] != null ? map['hasPrevPage'] as bool : null,
      hasNextPage: map['hasNextPage'] != null ? map['hasNextPage'] as bool : null,
      prevPage: map['prevPage'] as dynamic,
      nextPage: map['nextPage'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Doc {
  LoadDetail? loadDetail;
  Vehicle? vehicle;
  Payment? advancePayment;
  Payment? deliveryPayment;
  String? id;
  Pickup? pickup;
  Receiver? receiver;
  String? customer;
  String? postType;
  String? status;
  DateTime? postExpiryDate;
  DateTime? pickupDate;
  int? fare;
  int? commission;
  bool? isArchived;
  int? lowestBid;
  int? lowestBidder;
  int? vehicleAccepted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Doc({
    this.loadDetail,
    this.vehicle,
    this.advancePayment,
    this.deliveryPayment,
    this.id,
    this.pickup,
    this.receiver,
    this.customer,
    this.postType,
    this.status,
    this.postExpiryDate,
    this.pickupDate,
    this.fare,
    this.commission,
    this.isArchived,
    this.lowestBid,
    this.lowestBidder,
    this.vehicleAccepted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadDetail': loadDetail?.toMap(),
      'vehicle': vehicle?.toMap(),
      'advancePayment': advancePayment?.toMap(),
      'deliveryPayment': deliveryPayment?.toMap(),
      'id': id,
      'pickup': pickup?.toMap(),
      'receiver': receiver?.toMap(),
      'customer': customer,
      'postType': postType,
      'status': status,
      'postExpiryDate': postExpiryDate?.millisecondsSinceEpoch,
      'pickupDate': pickupDate?.millisecondsSinceEpoch,
      'fare': fare,
      'commission': commission,
      'isArchived': isArchived,
      'lowestBid': lowestBid,
      'lowestBidder': lowestBidder,
      'vehicleAccepted': vehicleAccepted,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory Doc.fromMap(Map<String, dynamic> map) {
    return Doc(
      loadDetail: map['loadDetail'] != null ? LoadDetail.fromMap(map['loadDetail'] as Map<String,dynamic>) : null,
      vehicle: map['vehicle'] != null ? Vehicle.fromMap(map['vehicle'] as Map<String,dynamic>) : null,
      advancePayment: map['advancePayment'] != null ? Payment.fromMap(map['advancePayment'] as Map<String,dynamic>) : null,
      deliveryPayment: map['deliveryPayment'] != null ? Payment.fromMap(map['deliveryPayment'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as String : null,
      pickup: map['pickup'] != null ? Pickup.fromMap(map['pickup'] as Map<String,dynamic>) : null,
      receiver: map['receiver'] != null ? Receiver.fromMap(map['receiver'] as Map<String,dynamic>) : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      postType: map['postType'] != null ? map['postType'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      postExpiryDate: map['postExpiryDate'] != null ? DateTime.parse(map['postExpiryDate']) : null,
      pickupDate: map['pickupDate'] != null ? DateTime.parse(map['pickupDate']) : null,
      fare: map['fare'] != null ? map['fare'] as int : null,
      commission: map['commission'] != null ? map['commission'] as int : null,
      isArchived: map['isArchived'] != null ? map['isArchived'] as bool : null,
      lowestBid: map['lowestBid'] != null ? map['lowestBid'] as int : null,
      lowestBidder: map['lowestBidder'] != null ? map['lowestBidder'] as int : null,
      vehicleAccepted: map['vehicleAccepted'] != null ? map['vehicleAccepted'] as int : null,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      v: map['v'] != null ? map['v'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doc.fromJson(String source) => Doc.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Payment {
  int? ratio;
  String? payBy;
  String? customer;
  String? mode;

  Payment({
    this.ratio,
    this.payBy,
    this.customer,
    this.mode,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ratio': ratio,
      'payBy': payBy,
      'customer': customer,
      'mode': mode,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      ratio: map['ratio'] != null ? map['ratio'] as int : null,
      payBy: map['payBy'] != null ? map['payBy'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      mode: map['mode'] != null ? map['mode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LoadDetail {
  LoadSize? loadSize;
  int? load;
  String? loadUnit;
  List<String>? goodsImage;
  String? description;
  String? loadType;

  LoadDetail({
    this.loadSize,
    this.load,
    this.loadUnit,
    this.goodsImage,
    this.description,
    this.loadType,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loadSize': loadSize?.toMap(),
      'load': load,
      'loadUnit': loadUnit,
      'goodsImage': goodsImage,
      'description': description,
      'loadType': loadType,
    };
  }

  factory LoadDetail.fromMap(Map<String, dynamic> map) {
    return LoadDetail(
      loadSize: map['loadSize'] != null ? LoadSize.fromMap(map['loadSize'] as Map<String,dynamic>) : null,
      load: map['load'] != null ? map['load'] as int : null,
      loadUnit: map['loadUnit'] != null ? map['loadUnit'] as String : null,
      goodsImage: map['goodsImage'] != null ? List<String>.from((map['goodsImage'])) : [],
      description: map['description'] != null ? map['description'] as String : null,
      loadType: map['loadType'] != null ? map['loadType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoadDetail.fromJson(String source) => LoadDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LoadSize {
  int? length;
  int? width;
  int? height;

  LoadSize({
    this.length,
    this.width,
    this.height,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'length': length,
      'width': width,
      'height': height,
    };
  }

  factory LoadSize.fromMap(Map<String, dynamic> map) {
    return LoadSize(
      length: map['length'] != null ? map['length'] as int : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoadSize.fromJson(String source) => LoadSize.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Pickup {
  String? reference;
  String? name;
  String? phone;
  Geo? geo;
  Address? address;
  String? customer;
  String? id;

  Pickup({
    this.reference,
    this.name,
    this.phone,
    this.geo,
    this.address,
    this.customer,
    this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reference': reference,
      'name': name,
      'phone': phone,
      'geo': geo?.toMap(),
      'address': address?.toMap(),
      'customer': customer,
      'id': id,
    };
  }

  factory Pickup.fromMap(Map<String, dynamic> map) {
    return Pickup(
      reference: map['reference'] != null ? map['reference'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      geo: map['geo'] != null ? Geo.fromMap(map['geo'] as Map<String,dynamic>) : null,
      address: map['address'] != null ? Address.fromMap(map['address'] as Map<String,dynamic>) : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pickup.fromJson(String source) => Pickup.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Address {
  String? street;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? district;
  String? laneNumber;
  String? id;

  Address({
    this.street,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.district,
    this.laneNumber,
    this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'district': district,
      'laneNumber': laneNumber,
      'id': id,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] != null ? map['street'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      postalCode: map['postalCode'] != null ? map['postalCode'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      laneNumber: map['laneNumber'] != null ? map['laneNumber'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Geo {
  String? type;
  String? address;
  List<double>? coordinates;
  String? id;

  Geo({
    this.type,
    this.address,
    this.coordinates,
    this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'address': address,
      'coordinates': coordinates,
      'id': id,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      type: map['type'] != null ? map['type'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      coordinates: map['coordinates'] != null ? List<double>.from((map['coordinates'])) : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Receiver {
  String? name;
  String? phone;
  Address? address;
  String? customer;
  String? id;

  Receiver({
    this.name,
    this.phone,
    this.address,
    this.customer,
    this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'address': address?.toMap(),
      'customer': customer,
      'id': id,
    };
  }

  factory Receiver.fromMap(Map<String, dynamic> map) {
    return Receiver(
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? Address.fromMap(map['address'] as Map<String,dynamic>) : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Receiver.fromJson(String source) => Receiver.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Vehicle {
  String? vehicleType;
  String? trailorType;
  int? capacity;
  int? quantity;
  int? length;
  String? tyreType;
  String? capacityUnit;
  int? quantityAccepted;
  int? width;
  int? height;

  Vehicle({
    this.vehicleType,
    this.trailorType,
    this.capacity,
    this.quantity,
    this.length,
    this.tyreType,
    this.capacityUnit,
    this.quantityAccepted,
    this.width,
    this.height,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vehicleType': vehicleType,
      'trailorType': trailorType,
      'capacity': capacity,
      'quantity': quantity,
      'length': length,
      'tyreType': tyreType,
      'capacityUnit': capacityUnit,
      'quantityAccepted': quantityAccepted,
      'width': width,
      'height': height,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      vehicleType: map['vehicleType'] != null ? map['vehicleType'] as String : null,
      trailorType: map['trailorType'] != null ? map['trailorType'] as String : null,
      capacity: map['capacity'] != null ? map['capacity'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      length: map['length'] != null ? map['length'] as int : null,
      tyreType: map['tyreType'] != null ? map['tyreType'] as String : null,
      capacityUnit: map['capacityUnit'] != null ? map['capacityUnit'] as String : null,
      quantityAccepted: map['quantityAccepted'] != null ? map['quantityAccepted'] as int : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) => Vehicle.fromMap(json.decode(source) as Map<String, dynamic>);
}
