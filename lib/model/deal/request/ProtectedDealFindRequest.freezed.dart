// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProtectedDealFindRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProtectedDealFindRequest _$ProtectedDealFindRequestFromJson(
    Map<String, dynamic> json) {
  return _ProtectedDealFindRequest.fromJson(json);
}

/// @nodoc
mixin _$ProtectedDealFindRequest {
  int get getterId => throw _privateConstructorUsedError;
  int get providerId => throw _privateConstructorUsedError;
  int get homeId => throw _privateConstructorUsedError;
  int get dmId => throw _privateConstructorUsedError;

  /// Serializes this ProtectedDealFindRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProtectedDealFindRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtectedDealFindRequestCopyWith<ProtectedDealFindRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtectedDealFindRequestCopyWith<$Res> {
  factory $ProtectedDealFindRequestCopyWith(ProtectedDealFindRequest value,
          $Res Function(ProtectedDealFindRequest) then) =
      _$ProtectedDealFindRequestCopyWithImpl<$Res, ProtectedDealFindRequest>;
  @useResult
  $Res call({int getterId, int providerId, int homeId, int dmId});
}

/// @nodoc
class _$ProtectedDealFindRequestCopyWithImpl<$Res,
        $Val extends ProtectedDealFindRequest>
    implements $ProtectedDealFindRequestCopyWith<$Res> {
  _$ProtectedDealFindRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProtectedDealFindRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getterId = null,
    Object? providerId = null,
    Object? homeId = null,
    Object? dmId = null,
  }) {
    return _then(_value.copyWith(
      getterId: null == getterId
          ? _value.getterId
          : getterId // ignore: cast_nullable_to_non_nullable
              as int,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as int,
      homeId: null == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int,
      dmId: null == dmId
          ? _value.dmId
          : dmId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProtectedDealFindRequestImplCopyWith<$Res>
    implements $ProtectedDealFindRequestCopyWith<$Res> {
  factory _$$ProtectedDealFindRequestImplCopyWith(
          _$ProtectedDealFindRequestImpl value,
          $Res Function(_$ProtectedDealFindRequestImpl) then) =
      __$$ProtectedDealFindRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int getterId, int providerId, int homeId, int dmId});
}

/// @nodoc
class __$$ProtectedDealFindRequestImplCopyWithImpl<$Res>
    extends _$ProtectedDealFindRequestCopyWithImpl<$Res,
        _$ProtectedDealFindRequestImpl>
    implements _$$ProtectedDealFindRequestImplCopyWith<$Res> {
  __$$ProtectedDealFindRequestImplCopyWithImpl(
      _$ProtectedDealFindRequestImpl _value,
      $Res Function(_$ProtectedDealFindRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProtectedDealFindRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getterId = null,
    Object? providerId = null,
    Object? homeId = null,
    Object? dmId = null,
  }) {
    return _then(_$ProtectedDealFindRequestImpl(
      getterId: null == getterId
          ? _value.getterId
          : getterId // ignore: cast_nullable_to_non_nullable
              as int,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as int,
      homeId: null == homeId
          ? _value.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as int,
      dmId: null == dmId
          ? _value.dmId
          : dmId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtectedDealFindRequestImpl implements _ProtectedDealFindRequest {
  _$ProtectedDealFindRequestImpl(
      {required this.getterId,
      required this.providerId,
      required this.homeId,
      required this.dmId});

  factory _$ProtectedDealFindRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProtectedDealFindRequestImplFromJson(json);

  @override
  final int getterId;
  @override
  final int providerId;
  @override
  final int homeId;
  @override
  final int dmId;

  @override
  String toString() {
    return 'ProtectedDealFindRequest(getterId: $getterId, providerId: $providerId, homeId: $homeId, dmId: $dmId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtectedDealFindRequestImpl &&
            (identical(other.getterId, getterId) ||
                other.getterId == getterId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.dmId, dmId) || other.dmId == dmId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, getterId, providerId, homeId, dmId);

  /// Create a copy of ProtectedDealFindRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtectedDealFindRequestImplCopyWith<_$ProtectedDealFindRequestImpl>
      get copyWith => __$$ProtectedDealFindRequestImplCopyWithImpl<
          _$ProtectedDealFindRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtectedDealFindRequestImplToJson(
      this,
    );
  }
}

abstract class _ProtectedDealFindRequest implements ProtectedDealFindRequest {
  factory _ProtectedDealFindRequest(
      {required final int getterId,
      required final int providerId,
      required final int homeId,
      required final int dmId}) = _$ProtectedDealFindRequestImpl;

  factory _ProtectedDealFindRequest.fromJson(Map<String, dynamic> json) =
      _$ProtectedDealFindRequestImpl.fromJson;

  @override
  int get getterId;
  @override
  int get providerId;
  @override
  int get homeId;
  @override
  int get dmId;

  /// Create a copy of ProtectedDealFindRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtectedDealFindRequestImplCopyWith<_$ProtectedDealFindRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
