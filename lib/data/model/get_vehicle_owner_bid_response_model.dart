// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class GetVehicleOwnerBidResponseModel {
  bool? success;
  List<Datum>? data;
  String? message;

  GetVehicleOwnerBidResponseModel({
    this.success,
    this.data,
    this.message,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'data': data?.map((x) => x?.toMap()).toList(),
      'message': message,
    };
  }

  factory GetVehicleOwnerBidResponseModel.fromMap(Map<String, dynamic> map) {
    print(map['data']);
    print(map['success']);
    return GetVehicleOwnerBidResponseModel(
      success: map['success'] != null ? map['success'] as bool : null,
      data: map['data'] != null ? List<Datum>.from((map['data']).map<Datum?>((x) => Datum.fromMap(x as Map<String,dynamic>),),) : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  }

class Datum {
  String? id;
  Customer? customer;
  String? post;
  String? status;
  String? cancellationReason;
  int? bidAmount;
  int? totalAmount;
  int? paidAmount;
  List<Vehicle>? vehicles;
  bool? isDeleted;
  bool? isArchived;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.customer,
    this.post,
    this.status,
    this.cancellationReason,
    this.bidAmount,
    this.totalAmount,
    this.paidAmount,
    this.vehicles,
    this.isDeleted,
    this.isArchived,
    this.createdAt,
    this.updatedAt,
    this.v,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customer': customer?.toMap(),
      'post': post,
      'status': status,
      'cancellationReason': cancellationReason,
      'bidAmount': bidAmount,
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
      'vehicles': vehicles?.map((x) => x.toMap()).toList(),
      'isDeleted': isDeleted,
      'isArchived': isArchived,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory Datum.fromMap(Map<String, dynamic> map) {
    return Datum(
      id: map['id'] != null ? map['id'] as String : null,
      customer: map['customer'] != null ? Customer.fromMap(map['customer'] as Map<String,dynamic>) : null,
      post: map['post'] != null ? map['post'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      cancellationReason: map['cancellationReason'] != null ? map['cancellationReason'] as String : null,
      bidAmount: map['bidAmount'] != null ? map['bidAmount'] as int : null,
      totalAmount: map['totalAmount'] != null ? map['totalAmount'] as int : null,
      paidAmount: map['paidAmount'] != null ? map['paidAmount'] as int : null,
      vehicles: map['vehicles'] != null ? List<Vehicle>.from((map['vehicles'] as List<dynamic>).map<Vehicle?>((x) => Vehicle.fromMap(x as Map<String,dynamic>),),) : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isArchived: map['isArchived'] != null ? map['isArchived'] as bool : null,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      v: map['v'] != null ? map['v'] as int : null,
    );
  }

  }

class Customer {
  Rating? rating;
  String? id;
  String? phone;
  String? name;
  String? companyAddress;

  Customer({
    this.rating,
    this.id,
    this.phone,
    this.name,
    this.companyAddress,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating?.toMap(),
      'id': id,
      'phone': phone,
      'name': name,
      'companyAddress': companyAddress,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      rating: map['rating'] != null ? Rating.fromMap(map['rating'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      companyAddress: map['companyAddress'] != null ? map['companyAddress'] as String : null,
    );
  }

 }

class Rating {
  int? rate;
  int? total;

  Rating({
    this.rate,
    this.total,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'total': total,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'] != null ? map['rate'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  }

class Vehicle {
  Fitness? nationalPermit;
  Fitness? insurance;
  Fitness? fitness;
  Fitness? pollutionControl;
  String? id;
  String? name;
  String? nameLowerCase;
  String? description;
  String? customer;
  String? photo;
  String? vehicleNumber;
  String? chassisNumber;
  String? engineNumber;
  String? vehicleType;
  String? tyreType;
  String? registrationCertificatePhoto;
  int? rlwKg;
  int? length;
  int? width;
  int? height;
  bool? isArchived;
  String? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? updatedBy;

  Vehicle({
    this.nationalPermit,
    this.insurance,
    this.fitness,
    this.pollutionControl,
    this.id,
    this.name,
    this.nameLowerCase,
    this.description,
    this.customer,
    this.photo,
    this.vehicleNumber,
    this.chassisNumber,
    this.engineNumber,
    this.vehicleType,
    this.tyreType,
    this.registrationCertificatePhoto,
    this.rlwKg,
    this.length,
    this.width,
    this.height,
    this.isArchived,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.updatedBy,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nationalPermit': nationalPermit?.toMap(),
      'insurance': insurance?.toMap(),
      'fitness': fitness?.toMap(),
      'pollutionControl': pollutionControl?.toMap(),
      'id': id,
      'name': name,
      'nameLowerCase': nameLowerCase,
      'description': description,
      'customer': customer,
      'photo': photo,
      'vehicleNumber': vehicleNumber,
      'chassisNumber': chassisNumber,
      'engineNumber': engineNumber,
      'vehicleType': vehicleType,
      'tyreType': tyreType,
      'registrationCertificatePhoto': registrationCertificatePhoto,
      'rlwKg': rlwKg,
      'length': length,
      'width': width,
      'height': height,
      'isArchived': isArchived,
      'createdBy': createdBy,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'v': v,
      'updatedBy': updatedBy,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      nationalPermit: map['nationalPermit'] != null ? Fitness.fromMap(map['nationalPermit'] as Map<String,dynamic>) : null,
      insurance: map['insurance'] != null ? Fitness.fromMap(map['insurance'] as Map<String,dynamic>) : null,
      fitness: map['fitness'] != null ? Fitness.fromMap(map['fitness'] as Map<String,dynamic>) : null,
      pollutionControl: map['pollutionControl'] != null ? Fitness.fromMap(map['pollutionControl'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nameLowerCase: map['nameLowerCase'] != null ? map['nameLowerCase'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      customer: map['customer'] != null ? map['customer'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      vehicleNumber: map['vehicleNumber'] != null ? map['vehicleNumber'] as String : null,
      chassisNumber: map['chassisNumber'] != null ? map['chassisNumber'] as String : null,
      engineNumber: map['engineNumber'] != null ? map['engineNumber'] as String : null,
      vehicleType: map['vehicleType'] != null ? map['vehicleType'] as String : null,
      tyreType: map['tyreType'] != null ? map['tyreType'] as String : null,
      registrationCertificatePhoto: map['registrationCertificatePhoto'] != null ? map['registrationCertificatePhoto'] as String : null,
      rlwKg: map['rlwKg'] != null ? map['rlwKg'] as int : null,
      length: map['length'] != null ? map['length'] as int : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      isArchived: map['isArchived'] != null ? map['isArchived'] as bool : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      v: map['v'] != null ? map['v'] as int : null,
      updatedBy: map['updatedBy'] != null ? map['updatedBy'] as String : null,
    );
  }

  }

class Fitness {
  bool? isValid;

  Fitness({
    this.isValid,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isValid': isValid,
    };
  }

  factory Fitness.fromMap(Map<String, dynamic> map) {
    return Fitness(
      isValid: map['isValid'] != null ? map['isValid'] as bool : null,
    );
  }

  }


