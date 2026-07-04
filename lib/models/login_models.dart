// ==========================================
// MEDIA MODEL
// ==========================================
class MediaModel {
  final int id;
  final String modelType;
  final int modelId;
  final String uuid;
  final String collectionName;
  final String name;
  final String fileName;
  final String mimeType;
  final String disk;
  final String conversionsDisk;
  final int size;
  final String originalUrl;
  final String previewUrl;
  final String createdAt;
  final String updatedAt;

  MediaModel({
    required this.id,
    required this.modelType,
    required this.modelId,
    required this.uuid,
    required this.collectionName,
    required this.name,
    required this.fileName,
    required this.mimeType,
    required this.disk,
    required this.conversionsDisk,
    required this.size,
    required this.originalUrl,
    required this.previewUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  /*fromJson start here*/
  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'] ?? 0,
      modelType: json['model_type'] ?? '',
      modelId: json['model_id'] ?? 0,
      uuid: json['uuid'] ?? '',
      collectionName: json['collection_name'] ?? '',
      name: json['name'] ?? '',
      fileName: json['file_name'] ?? '',
      mimeType: json['mime_type'] ?? '',
      disk: json['disk'] ?? '',
      conversionsDisk: json['conversions_disk'] ?? '',
      size: json['size'] ?? 0,
      originalUrl: json['original_url'] ?? '',
      previewUrl: json['preview_url'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  /*fromJson end here*/

  /*toJson start here*/
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model_type': modelType,
      'model_id': modelId,
      'uuid': uuid,
      'collection_name': collectionName,
      'name': name,
      'file_name': fileName,
      'mime_type': mimeType,
      'disk': disk,
      'conversions_disk': conversionsDisk,
      'size': size,
      'original_url': originalUrl,
      'preview_url': previewUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  /*toJson end here*/

  /*toString start here*/
  @override
  String toString() {
    return 'MediaModel('
        'id: $id, '
        'modelType: $modelType, '
        'modelId: $modelId, '
        'uuid: $uuid, '
        'collectionName: $collectionName, '
        'name: $name, '
        'fileName: $fileName, '
        'mimeType: $mimeType, '
        'disk: $disk, '
        'conversionsDisk: $conversionsDisk, '
        'size: $size, '
        'originalUrl: $originalUrl, '
        'previewUrl: $previewUrl, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt'
        ')';
  }
/*toString end here*/
}

// ==========================================
// USER MODEL
// ==========================================
class UserModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? emailVerifiedAt;
  final String? phoneNo;
  final String? createdAt;
  final String? updatedAt;
  final String? referalCode;
  final int? rewardPoints;
  final String? language;
  final String? firebaseWebToken;
  final String? firebaseMobileToken;
  final String? walletId;
  final String? address;
  final String? lat;
  final String? long;
  final String? deviceType;
  final String? countryCode;
  final String? provider;
  final String? accessToken;
  final String? nearestAddress;
  final String? isDeleted;
  final String? storeId;
  final String? kioskUserId;
  final String? image;
  final String? imageUrl;
  final List<MediaModel>? media;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.phoneNo,
    this.createdAt,
    this.updatedAt,
    this.referalCode,
    this.rewardPoints,
    this.language,
    this.firebaseWebToken,
    this.firebaseMobileToken,
    this.walletId,
    this.address,
    this.lat,
    this.long,
    this.deviceType,
    this.countryCode,
    this.provider,
    this.accessToken,
    this.nearestAddress,
    this.isDeleted,
    this.storeId,
    this.kioskUserId,
    this.image,
    this.imageUrl,
    this.media,
  });

  /*fullName getter start here*/
  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();

  /*fullName getter end here*/

  /*fromJson start here*/
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phoneNo: json['phone_no'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      referalCode: json['referal_code'],
      rewardPoints: json['reward_points'],
      language: json['language'],
      firebaseWebToken: json['firebase_web_token'],
      firebaseMobileToken: json['firebase_mobile_token'],
      walletId: json['walletId'],
      address: json['address'],
      lat: json['lat'],
      long: json['long'],
      deviceType: json['device_type'],
      countryCode: json['country_code'],
      provider: json['provider'],
      accessToken: json['access_token'],
      nearestAddress: json['nearest_address'],
      isDeleted: json['is_deleted'],
      storeId: json['store_id'],
      kioskUserId: json['kiosk_user_id'],
      image: json['image'],
      imageUrl: json['image_url'],
      media: json['media'] != null
          ? (json['media'] as List).map((m) => MediaModel.fromJson(m)).toList()
          : null,
    );
  }

  /*fromJson end here*/

  /*toJson start here*/
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'phone_no': phoneNo,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'referal_code': referalCode,
      'reward_points': rewardPoints,
      'language': language,
      'firebase_web_token': firebaseWebToken,
      'firebase_mobile_token': firebaseMobileToken,
      'walletId': walletId,
      'address': address,
      'lat': lat,
      'long': long,
      'device_type': deviceType,
      'country_code': countryCode,
      'provider': provider,
      'access_token': accessToken,
      'nearest_address': nearestAddress,
      'is_deleted': isDeleted,
      'store_id': storeId,
      'kiosk_user_id': kioskUserId,
      'image': image,
      'image_url': imageUrl,
      'media': media?.map((m) => m.toJson()).toList(),
    };
  }

  /*toJson end here*/

  /*toString start here*/
  @override
  String toString() {
    return 'UserModel('
        'id: $id, '
        'firstName: $firstName, '
        'lastName: $lastName, '
        'fullName: $fullName, '
        'email: $email, '
        'emailVerifiedAt: $emailVerifiedAt, '
        'phoneNo: $phoneNo, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'referalCode: $referalCode, '
        'rewardPoints: $rewardPoints, '
        'language: $language, '
        'firebaseWebToken: $firebaseWebToken, '
        'firebaseMobileToken: $firebaseMobileToken, '
        'walletId: $walletId, '
        'address: $address, '
        'lat: $lat, '
        'long: $long, '
        'deviceType: $deviceType, '
        'countryCode: $countryCode, '
        'provider: $provider, '
        'accessToken: $accessToken, '
        'nearestAddress: $nearestAddress, '
        'isDeleted: $isDeleted, '
        'storeId: $storeId, '
        'kioskUserId: $kioskUserId, '
        'image: $image, '
        'imageUrl: $imageUrl, '
        'media: $media'
        ')';
  }
/*toString end here*/
}

// ==========================================
// LOGIN RESPONSE MODEL
// ==========================================
class LoginResponseModel {
  final bool status;
  final String token;
  final String message;
  final UserModel data;

  LoginResponseModel({
    required this.status,
    required this.token,
    required this.message,
    required this.data,
  });

  /*fromJson start here*/
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? false,
      token: json['token'] ?? '',
      message: json['message'] ?? '',
      data: UserModel.fromJson(json['data']),
    );
  }

  /*fromJson end here*/

  /*toJson start here*/
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
      'message': message,
      'data': data.toJson(),
    };
  }

  /*toJson end here*/

  /*toString start here*/
  @override
  String toString() {
    return 'LoginResponseModel('
        'status: $status, '
        'token: $token, '
        'message: $message, '
        'data: $data'
        ')';
  }
/*toString end here*/
}