// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HomeAddressGeneratorRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeAddressGeneratorRequest _$HomeAddressGeneratorRequestFromJson(
    Map<String, dynamic> json) {
  return _HomeAddressGeneratorRequest.fromJson(json);
}

/// @nodoc
mixin _$HomeAddressGeneratorRequest {
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  int get postCode => throw _privateConstructorUsedError;
  String get detailAddress => throw _privateConstructorUsedError;
  String get streetName => throw _privateConstructorUsedError;
  String get streetCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeAddressGeneratorRequestCopyWith<HomeAddressGeneratorRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAddressGeneratorRequestCopyWith<$Res> {
  factory $HomeAddressGeneratorRequestCopyWith(
          HomeAddressGeneratorRequest value,
          $Res Function(HomeAddressGeneratorRequest) then) =
      _$HomeAddressGeneratorRequestCopyWithImpl<$Res,
          HomeAddressGeneratorRequest>;
  @useResult
  $Res call(
      {String state,
      String city,
      int postCode,
      String detailAddress,
      String streetName,
      String streetCode});
}

/// @nodoc
class _$HomeAddressGeneratorRequestCopyWithImpl<$Res,
        $Val extends HomeAddressGeneratorRequest>
    implements $HomeAddressGeneratorRequestCopyWith<$Res> {
  _$HomeAddressGeneratorRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? city = null,
    Object? postCode = null,
    Object? detailAddress = null,
    Object? streetName = null,
    Object? streetCode = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      postCode: null == postCode
          ? _value.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as int,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      streetName: null == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      streetCode: null == streetCode
          ? _value.streetCode
          : streetCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeAddressGeneratorRequestImplCopyWith<$Res>
    implements $HomeAddressGeneratorRequestCopyWith<$Res> {
  factory _$$HomeAddressGeneratorRequestImplCopyWith(
          _$HomeAddressGeneratorRequestImpl value,
          $Res Function(_$HomeAddressGeneratorRequestImpl) then) =
      __$$HomeAddressGeneratorRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String state,
      String city,
      int postCode,
      String detailAddress,
      String streetName,
      String streetCode});
}

/// @nodoc
class __$$HomeAddressGeneratorRequestImplCopyWithImpl<$Res>
    extends _$HomeAddressGeneratorRequestCopyWithImpl<$Res,
        _$HomeAddressGeneratorRequestImpl>
    implements _$$HomeAddressGeneratorRequestImplCopyWith<$Res> {
  __$$HomeAddressGeneratorRequestImplCopyWithImpl(
      _$HomeAddressGeneratorRequestImpl _value,
      $Res Function(_$HomeAddressGeneratorRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? city = null,
    Object? postCode = null,
    Object? detailAddress = null,
    Object? streetName = null,
    Object? streetCode = null,
  }) {
    return _then(_$HomeAddressGeneratorRequestImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      postCode: null == postCode
          ? _value.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as int,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      streetName: null == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      streetCode: null == streetCode
          ? _value.streetCode
          : streetCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeAddressGeneratorRequestImpl
    implements _HomeAddressGeneratorRequest {
  const _$HomeAddressGeneratorRequestImpl(
      {required this.state,
      required this.city,
      required this.postCode,
      required this.detailAddress,
      required this.streetName,
      required this.streetCode});

  factory _$HomeAddressGeneratorRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HomeAddressGeneratorRequestImplFromJson(json);

  @override
  final String state;
  @override
  final String city;
  @override
  final int postCode;
  @override
  final String detailAddress;
  @override
  final String streetName;
  @override
  final String streetCode;

  @override
  String toString() {
    return 'HomeAddressGeneratorRequest(state: $state, city: $city, postCode: $postCode, detailAddress: $detailAddress, streetName: $streetName, streetCode: $streetCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeAddressGeneratorRequestImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.detailAddress, detailAddress) ||
                other.detailAddress == detailAddress) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.streetCode, streetCode) ||
                other.streetCode == streetCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, city, postCode,
      detailAddress, streetName, streetCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeAddressGeneratorRequestImplCopyWith<_$HomeAddressGeneratorRequestImpl>
      get copyWith => __$$HomeAddressGeneratorRequestImplCopyWithImpl<
          _$HomeAddressGeneratorRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeAddressGeneratorRequestImplToJson(
      this,
    );
  }
}

abstract class _HomeAddressGeneratorRequest
    implements HomeAddressGeneratorRequest {
  const factory _HomeAddressGeneratorRequest(
      {required final String state,
      required final String city,
      required final int postCode,
      required final String detailAddress,
      required final String streetName,
      required final String streetCode}) = _$HomeAddressGeneratorRequestImpl;

  factory _HomeAddressGeneratorRequest.fromJson(Map<String, dynamic> json) =
      _$HomeAddressGeneratorRequestImpl.fromJson;

  @override
  String get state;
  @override
  String get city;
  @override
  int get postCode;
  @override
  String get detailAddress;
  @override
  String get streetName;
  @override
  String get streetCode;
  @override
  @JsonKey(ignore: true)
  _$$HomeAddressGeneratorRequestImplCopyWith<_$HomeAddressGeneratorRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
