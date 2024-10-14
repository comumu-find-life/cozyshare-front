// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HomeInformationResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeInformationResponse _$HomeInformationResponseFromJson(
    Map<String, dynamic> json) {
  return _HomeInformationResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeInformationResponse {
  String? get providerId => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get options => throw _privateConstructorUsedError;
  int? get bond => throw _privateConstructorUsedError;
  int? get residentCount => throw _privateConstructorUsedError;
  int? get homeId => throw _privateConstructorUsedError;
  String? get providerProfileUrl => throw _privateConstructorUsedError;
  String? get providerName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  int? get bill => throw _privateConstructorUsedError;
  int? get rent => throw _privateConstructorUsedError;
  HomeType? get type => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  String? get introduce => throw _privateConstructorUsedError;
  int? get bathRoomCount => throw _privateConstructorUsedError;
  int? get bedroomCount => throw _privateConstructorUsedError;

  /// Serializes this HomeInformationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeInformationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeInformationResponseCopyWith<HomeInformationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeInformationResponseCopyWith<$Res> {
  factory $HomeInformationResponseCopyWith(HomeInformationResponse value,
          $Res Function(HomeInformationResponse) then) =
      _$HomeInformationResponseCopyWithImpl<$Res, HomeInformationResponse>;
  @useResult
  $Res call(
      {String? providerId,
      double? latitude,
      double? longitude,
      String? options,
      int? bond,
      int? residentCount,
      int? homeId,
      String? providerProfileUrl,
      String? providerName,
      String? address,
      List<String>? images,
      int? bill,
      int? rent,
      HomeType? type,
      Gender? gender,
      String? introduce,
      int? bathRoomCount,
      int? bedroomCount});
}

/// @nodoc
class _$HomeInformationResponseCopyWithImpl<$Res,
        $Val extends HomeInformationResponse>
    implements $HomeInformationResponseCopyWith<$Res> {
  _$HomeInformationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeInformationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? options = freezed,
    Object? bond = freezed,
    Object? residentCount = freezed,
    Object? homeId = freezed,
    Object? providerProfileUrl = freezed,
    Object? providerName = freezed,
    Object? address = freezed,
    Object? images = freezed,
    Object? bill = freezed,
    Object? rent = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? introduce = freezed,
    Object? bathRoomCount = freezed,
    Object? bedroomCount = freezed,
  }) {
    return _then(_value.copyWith(
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as String?,
      bond: freezed == bond
          ? _value.bond
          : bond // ignore: cast_nullable_to_non_nullable
              as int?,
      residentCount: freezed == residentCount
          ? _value.residentCount
          : residentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      providerProfileUrl: freezed == providerProfileUrl
          ? _value.providerProfileUrl
          : providerProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      providerName: freezed == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as int?,
      rent: freezed == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeType?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      bathRoomCount: freezed == bathRoomCount
          ? _value.bathRoomCount
          : bathRoomCount // ignore: cast_nullable_to_non_nullable
              as int?,
      bedroomCount: freezed == bedroomCount
          ? _value.bedroomCount
          : bedroomCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeInformationResponseImplCopyWith<$Res>
    implements $HomeInformationResponseCopyWith<$Res> {
  factory _$$HomeInformationResponseImplCopyWith(
          _$HomeInformationResponseImpl value,
          $Res Function(_$HomeInformationResponseImpl) then) =
      __$$HomeInformationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? providerId,
      double? latitude,
      double? longitude,
      String? options,
      int? bond,
      int? residentCount,
      int? homeId,
      String? providerProfileUrl,
      String? providerName,
      String? address,
      List<String>? images,
      int? bill,
      int? rent,
      HomeType? type,
      Gender? gender,
      String? introduce,
      int? bathRoomCount,
      int? bedroomCount});
}

/// @nodoc
class __$$HomeInformationResponseImplCopyWithImpl<$Res>
    extends _$HomeInformationResponseCopyWithImpl<$Res,
        _$HomeInformationResponseImpl>
    implements _$$HomeInformationResponseImplCopyWith<$Res> {
  __$$HomeInformationResponseImplCopyWithImpl(
      _$HomeInformationResponseImpl _value,
      $Res Function(_$HomeInformationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeInformationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? options = freezed,
    Object? bond = freezed,
    Object? residentCount = freezed,
    Object? homeId = freezed,
    Object? providerProfileUrl = freezed,
    Object? providerName = freezed,
    Object? address = freezed,
    Object? images = freezed,
    Object? bill = freezed,
    Object? rent = freezed,
    Object? type = freezed,
    Object? gender = freezed,
    Object? introduce = freezed,
    Object? bathRoomCount = freezed,
    Object? bedroomCount = freezed,
  }) {
    return _then(_$HomeInformationResponseImpl(
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as String?,
      bond: freezed == bond
          ? _value.bond
          : bond // ignore: cast_nullable_to_non_nullable
              as int?,
      residentCount: freezed == residentCount
          ? _value.residentCount
          : residentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      homeId: freezed == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int?,
      providerProfileUrl: freezed == providerProfileUrl
          ? _value.providerProfileUrl
          : providerProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      providerName: freezed == providerName
          ? _value.providerName
          : providerName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as int?,
      rent: freezed == rent
          ? _value.rent
          : rent // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HomeType?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      bathRoomCount: freezed == bathRoomCount
          ? _value.bathRoomCount
          : bathRoomCount // ignore: cast_nullable_to_non_nullable
              as int?,
      bedroomCount: freezed == bedroomCount
          ? _value.bedroomCount
          : bedroomCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeInformationResponseImpl implements _HomeInformationResponse {
  const _$HomeInformationResponseImpl(
      {required this.providerId,
      required this.latitude,
      required this.longitude,
      required this.options,
      required this.bond,
      required this.residentCount,
      required this.homeId,
      required this.providerProfileUrl,
      required this.providerName,
      required this.address,
      required final List<String>? images,
      required this.bill,
      required this.rent,
      required this.type,
      required this.gender,
      required this.introduce,
      required this.bathRoomCount,
      required this.bedroomCount})
      : _images = images;

  factory _$HomeInformationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeInformationResponseImplFromJson(json);

  @override
  final String? providerId;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? options;
  @override
  final int? bond;
  @override
  final int? residentCount;
  @override
  final int? homeId;
  @override
  final String? providerProfileUrl;
  @override
  final String? providerName;
  @override
  final String? address;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? bill;
  @override
  final int? rent;
  @override
  final HomeType? type;
  @override
  final Gender? gender;
  @override
  final String? introduce;
  @override
  final int? bathRoomCount;
  @override
  final int? bedroomCount;

  @override
  String toString() {
    return 'HomeInformationResponse(providerId: $providerId, latitude: $latitude, longitude: $longitude, options: $options, bond: $bond, residentCount: $residentCount, homeId: $homeId, providerProfileUrl: $providerProfileUrl, providerName: $providerName, address: $address, images: $images, bill: $bill, rent: $rent, type: $type, gender: $gender, introduce: $introduce, bathRoomCount: $bathRoomCount, bedroomCount: $bedroomCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeInformationResponseImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.bond, bond) || other.bond == bond) &&
            (identical(other.residentCount, residentCount) ||
                other.residentCount == residentCount) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.providerProfileUrl, providerProfileUrl) ||
                other.providerProfileUrl == providerProfileUrl) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.bill, bill) || other.bill == bill) &&
            (identical(other.rent, rent) || other.rent == rent) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.bathRoomCount, bathRoomCount) ||
                other.bathRoomCount == bathRoomCount) &&
            (identical(other.bedroomCount, bedroomCount) ||
                other.bedroomCount == bedroomCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      providerId,
      latitude,
      longitude,
      options,
      bond,
      residentCount,
      homeId,
      providerProfileUrl,
      providerName,
      address,
      const DeepCollectionEquality().hash(_images),
      bill,
      rent,
      type,
      gender,
      introduce,
      bathRoomCount,
      bedroomCount);

  /// Create a copy of HomeInformationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeInformationResponseImplCopyWith<_$HomeInformationResponseImpl>
      get copyWith => __$$HomeInformationResponseImplCopyWithImpl<
          _$HomeInformationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeInformationResponseImplToJson(
      this,
    );
  }
}

abstract class _HomeInformationResponse implements HomeInformationResponse {
  const factory _HomeInformationResponse(
      {required final String? providerId,
      required final double? latitude,
      required final double? longitude,
      required final String? options,
      required final int? bond,
      required final int? residentCount,
      required final int? homeId,
      required final String? providerProfileUrl,
      required final String? providerName,
      required final String? address,
      required final List<String>? images,
      required final int? bill,
      required final int? rent,
      required final HomeType? type,
      required final Gender? gender,
      required final String? introduce,
      required final int? bathRoomCount,
      required final int? bedroomCount}) = _$HomeInformationResponseImpl;

  factory _HomeInformationResponse.fromJson(Map<String, dynamic> json) =
      _$HomeInformationResponseImpl.fromJson;

  @override
  String? get providerId;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get options;
  @override
  int? get bond;
  @override
  int? get residentCount;
  @override
  int? get homeId;
  @override
  String? get providerProfileUrl;
  @override
  String? get providerName;
  @override
  String? get address;
  @override
  List<String>? get images;
  @override
  int? get bill;
  @override
  int? get rent;
  @override
  HomeType? get type;
  @override
  Gender? get gender;
  @override
  String? get introduce;
  @override
  int? get bathRoomCount;
  @override
  int? get bedroomCount;

  /// Create a copy of HomeInformationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeInformationResponseImplCopyWith<_$HomeInformationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
