class GetMyBidPostResponseModel {
  bool success;
  List<Datum> data;
  String message;

  GetMyBidPostResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  @override
  String toString() {
    return 'GetMyBidPostResponseModel{success: $success, data: $data, message: $message}';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'data': data.map((x) => x.toMap()).toList(),
      'message': message,
    };
  }

  factory GetMyBidPostResponseModel.fromMap(Map<String, dynamic> map) {
    print('GetMyBidPostResponseModel.fromMap $map');
    return GetMyBidPostResponseModel(
      success: map['success'] as bool,
      data: List<Datum>.from(
        (map['data']).map<Datum>(
          (x) => Datum.fromMap(x as Map<String, dynamic>),
        ),
      ),
      message: map['message'] as String,
    );
  }
}

class Datum {
  String? id;
  String? customer;
  Post? post;
  String? status;
  String? cancellationReason;
  int? bidAmount;
  int? paidAmount;
  bool? isDeleted;
  bool? isArchived;
  Advance? advance;
  Advance? delivery;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.customer,
    this.post,
    this.status,
    this.cancellationReason,
    this.bidAmount,
    this.paidAmount,
    this.isDeleted,
    this.isArchived,
    this.advance,
    this.delivery,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'customer': customer,
      'post': post?.toMap(),
      'status': status,
      'cancellationReason': cancellationReason,
      'bidAmount': bidAmount,
      'paidAmount': paidAmount,
      'isDeleted': isDeleted,
      'isArchived': isArchived,
      'advance': advance?.toMap(),
      'delivery': delivery?.toMap(),
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Datum.fromMap(Map<String, dynamic> map) {
    return Datum(
      id: map['_id'] != null ? map['_id'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      post: map['post'] != null
          ? Post.fromMap(map['post'])
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      cancellationReason: map['cancellationReason'] != null
          ? map['cancellationReason'] as String
          : null,
      bidAmount: map['bidAmount'] != null ? map['bidAmount'] as int : null,
      paidAmount: map['paidAmount'] != null ? map['paidAmount'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isArchived: map['isArchived'] != null ? map['isArchived'] as bool : null,
      advance: map['advance'] != null
          ? Advance.fromMap(map['advance'] as Map<String, dynamic>)
          : null,
      delivery: map['delivery'] != null
          ? Advance.fromMap(map['delivery'] as Map<String, dynamic>)
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
    );
  }
}

class Advance {
  int? ratio;
  String? mode;
  int? amount;
  bool? cashPaymentInitiated;
  bool? paid;
  String? payBy;
  String? customer;
  String? id;

  Advance({
    this.ratio,
    this.mode,
    this.amount,
    this.cashPaymentInitiated,
    this.paid,
    this.payBy,
    this.customer,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ratio': ratio,
      'mode': mode,
      'amount': amount,
      'cashPaymentInitiated': cashPaymentInitiated,
      'paid': paid,
      'payBy': payBy,
      'customer': customer,
      '_id': id,
    };
  }

  factory Advance.fromMap(Map<String, dynamic> map) {
    return Advance(
      ratio: map['ratio'] != null ? map['ratio'] as int : null,
      mode: map['mode'] != null ? map['mode'] as String : null,
      amount: map['amount'] != null ? map['amount'] as int : null,
      cashPaymentInitiated: map['cashPaymentInitiated'] != null
          ? map['cashPaymentInitiated'] as bool
          : null,
      paid: map['paid'] != null ? map['paid'] as bool : null,
      payBy: map['payBy'] != null ? map['payBy'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }
}

class Post {
  String? id;
  Pickup? pickup;
  Receiver? receiver;
  String? customer;
  String? postType;
  String? status;
  DateTime? postExpiryDate;
  DateTime? pickupDate;
  LoadDetail? loadDetail;
  Vehicle? vehicle;
  int? fare;
  int? commission;
  Payment? advancePayment;
  Payment? deliveryPayment;
  bool? isArchived;
  int? lowestBid;
  int? lowestBidder;
  int? vehicleAccepted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Post({
    this.id,
    this.pickup,
    this.receiver,
    this.customer,
    this.postType,
    this.status,
    this.postExpiryDate,
    this.pickupDate,
    this.loadDetail,
    this.vehicle,
    this.fare,
    this.commission,
    this.advancePayment,
    this.deliveryPayment,
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
      '_id': id,
      'pickup': pickup?.toMap(),
      'receiver': receiver?.toMap(),
      'customer': customer,
      'postType': postType,
      'status': status,
      'postExpiryDate': postExpiryDate?.millisecondsSinceEpoch,
      'pickupDate': pickupDate?.millisecondsSinceEpoch,
      'loadDetail': loadDetail?.toMap(),
      'vehicle': vehicle?.toMap(),
      'fare': fare,
      'commission': commission,
      'advancePayment': advancePayment?.toMap(),
      'deliveryPayment': deliveryPayment?.toMap(),
      'isArchived': isArchived,
      'lowestBid': lowestBid,
      'lowestBidder': lowestBidder,
      'vehicleAccepted': vehicleAccepted,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['_id'] != null ? map['_id'] as String : null,
      pickup: map['pickup'] != null
          ? Pickup.fromMap(map['pickup'])
          : null,
      receiver: map['receiver'] != null
          ? Receiver.fromMap(map['receiver'] as Map<String, dynamic>)
          : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      postType: map['postType'] != null ? map['postType'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      postExpiryDate: map['postExpiryDate'] != null
          ? DateTime.parse(map['postExpiryDate'])
          : null,
      pickupDate: map['pickupDate'] != null
          ? DateTime.parse(map['pickupDate'])
          : null,
      loadDetail: map['loadDetail'] != null
          ? LoadDetail.fromMap(map['loadDetail'] as Map<String, dynamic>)
          : null,
      vehicle: map['vehicle'] != null
          ? Vehicle.fromMap(map['vehicle'] as Map<String, dynamic>)
          : null,
      fare: map['fare'] != null ? map['fare'] as int : null,
      commission: map['commission'] != null ? map['commission'] as int : null,
      advancePayment: map['advancePayment'] != null
          ? Payment.fromMap(map['advancePayment'] as Map<String, dynamic>)
          : null,
      deliveryPayment: map['deliveryPayment'] != null
          ? Payment.fromMap(map['deliveryPayment'] as Map<String, dynamic>)
          : null,
      isArchived: map['isArchived'] != null ? map['isArchived'] as bool : null,
      lowestBid: map['lowestBid'] != null ? map['lowestBid'] as int : null,
      lowestBidder:
          map['lowestBidder'] != null ? map['lowestBidder'] as int : null,
      vehicleAccepted:
          map['vehicleAccepted'] != null ? map['vehicleAccepted'] as int : null,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
      v: map['v'] != null ? map['v'] as int : null,
    );
  }
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
}

class LoadDetail {
  int? load;
  String? loadUnit;
  LoadSize? loadSize;
  List<String>? goodsImage;
  String? description;
  String? loadType;

  LoadDetail({
    this.load,
    this.loadUnit,
    this.loadSize,
    this.goodsImage,
    this.description,
    this.loadType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'load': load,
      'loadUnit': loadUnit,
      'loadSize': loadSize?.toMap(),
      'goodsImage': goodsImage,
      'description': description,
      'loadType': loadType,
    };
  }

  factory LoadDetail.fromMap(Map<String, dynamic> map) {
    return LoadDetail(
      load: map['load'] != null ? map['load'] as int : null,
      loadUnit: map['loadUnit'] != null ? map['loadUnit'] as String : null,
      loadSize: map['loadSize'] != null
          ? LoadSize.fromMap(map['loadSize'] as Map<String, dynamic>)
          : null,
      goodsImage: map['goodsImage'] != null
          ? List<String>.from((map['goodsImage']))
          : [],
      description:
          map['description'] != null ? map['description'] as String : null,
      loadType: map['loadType'] != null ? map['loadType'] as String : null,
    );
  }
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
      '_id': id,
    };
  }

  factory Pickup.fromMap(Map<String, dynamic> map) {
    return Pickup(
      reference: map['reference'] != null ? map['reference'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      geo: map['geo'] != null
          ? Geo.fromMap(map['geo'])
          : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }
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
      '_id': id,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] != null ? map['street'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      postalCode:
          map['postalCode'] != null ? map['postalCode'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      laneNumber:
          map['laneNumber'] != null ? map['laneNumber'] as String : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }
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
      '_id': id,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      type: map['type'] != null ? map['type'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      coordinates: map['coordinates'] != null
          ? List<double>.from((map['coordinates']))
          : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }
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
      '_id': id,
    };
  }

  factory Receiver.fromMap(Map<String, dynamic> map) {
    return Receiver(
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null
          ? Address.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      id: map['_id'] != null ? map['_id'] as String : null,
    );
  }
}

class Vehicle {
  String? vehicleType;
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
      vehicleType:
          map['vehicleType'] != null ? map['vehicleType'] as String : null,
      capacity: map['capacity'] != null ? map['capacity'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      length: map['length'] != null ? map['length'] as int : null,
      tyreType: map['tyreType'] != null ? map['tyreType'] as String : null,
      capacityUnit:
          map['capacityUnit'] != null ? map['capacityUnit'] as String : null,
      quantityAccepted: map['quantityAccepted'] != null
          ? map['quantityAccepted'] as int
          : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
    );
  }
}
