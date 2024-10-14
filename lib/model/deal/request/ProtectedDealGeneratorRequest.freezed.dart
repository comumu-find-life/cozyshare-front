// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ProtectedDealGeneratorRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProtectedDealGeneratorRequest _$ProtectedDealGeneratorRequestFromJson(
    Map<String, dynamic> json) {
  return _ProtectedDealGeneratorRequest.fromJson(json);
}

/// @nodoc
mixin _$ProtectedDealGeneratorRequest {
  int get getterId => throw _privateConstructorUsedError;
  int get providerId => throw _privateConstructorUsedError;
  int get homeId => throw _privateConstructorUsedError;
  int get dmId => throw _privateConstructorUsedError;
  int get deposit => throw _privateConstructorUsedError;

  /// Serializes this ProtectedDealGeneratorRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProtectedDealGeneratorRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtectedDealGeneratorRequestCopyWith<ProtectedDealGeneratorRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtectedDealGeneratorRequestCopyWith<$Res> {
  factory $ProtectedDealGeneratorRequestCopyWith(
          ProtectedDealGeneratorRequest value,
          $Res Function(ProtectedDealGeneratorRequest) then) =
      _$ProtectedDealGeneratorRequestCopyWithImpl<$Res,
          ProtectedDealGeneratorRequest>;
  @useResult
  $Res call({int getterId, int providerId, int homeId, int dmId, int deposit});
}

/// @nodoc
class _$ProtectedDealGeneratorRequestCopyWithImpl<$Res,
        $Val extends ProtectedDealGeneratorRequest>
    implements $ProtectedDealGeneratorRequestCopyWith<$Res> {
  _$ProtectedDealGeneratorRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProtectedDealGeneratorRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getterId = null,
    Object? providerId = null,
    Object? homeId = null,
    Object? dmId = null,
    Object? deposit = null,
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
      deposit: null == deposit
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProtectedDealGeneratorRequestImplCopyWith<$Res>
    implements $ProtectedDealGeneratorRequestCopyWith<$Res> {
  factory _$$ProtectedDealGeneratorRequestImplCopyWith(
          _$ProtectedDealGeneratorRequestImpl value,
          $Res Function(_$ProtectedDealGeneratorRequestImpl) then) =
      __$$ProtectedDealGeneratorRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int getterId, int providerId, int homeId, int dmId, int deposit});
}

/// @nodoc
class __$$ProtectedDealGeneratorRequestImplCopyWithImpl<$Res>
    extends _$ProtectedDealGeneratorRequestCopyWithImpl<$Res,
        _$ProtectedDealGeneratorRequestImpl>
    implements _$$ProtectedDealGeneratorRequestImplCopyWith<$Res> {
  __$$ProtectedDealGeneratorRequestImplCopyWithImpl(
      _$ProtectedDealGeneratorRequestImpl _value,
      $Res Function(_$ProtectedDealGeneratorRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProtectedDealGeneratorRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getterId = null,
    Object? providerId = null,
    Object? homeId = null,
    Object? dmId = null,
    Object? deposit = null,
  }) {
    return _then(_$ProtectedDealGeneratorRequestImpl(
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
      deposit: null == deposit
          ? _value.deposit
          : deposit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtectedDealGeneratorRequestImpl
    implements _ProtectedDealGeneratorRequest {
  _$ProtectedDealGeneratorRequestImpl(
      {required this.getterId,
      required this.providerId,
      required this.homeId,
      required this.dmId,
      required this.deposit});

  factory _$ProtectedDealGeneratorRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProtectedDealGeneratorRequestImplFromJson(json);

  @override
  final int getterId;
  @override
  final int providerId;
  @override
  final int homeId;
  @override
  final int dmId;
  @override
  final int deposit;

  @override
  String toString() {
    return 'ProtectedDealGeneratorRequest(getterId: $getterId, providerId: $providerId, homeId: $homeId, dmId: $dmId, deposit: $deposit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtectedDealGeneratorRequestImpl &&
            (identical(other.getterId, getterId) ||
                other.getterId == getterId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.dmId, dmId) || other.dmId == dmId) &&
            (identical(other.deposit, deposit) || other.deposit == deposit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, getterId, providerId, homeId, dmId, deposit);

  /// Create a copy of ProtectedDealGeneratorRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtectedDealGeneratorRequestImplCopyWith<
          _$ProtectedDealGeneratorRequestImpl>
      get copyWith => __$$ProtectedDealGeneratorRequestImplCopyWithImpl<
          _$ProtectedDealGeneratorRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtectedDealGeneratorRequestImplToJson(
      this,
    );
  }
}

abstract class _ProtectedDealGeneratorRequest
    implements ProtectedDealGeneratorRequest {
  factory _ProtectedDealGeneratorRequest(
      {required final int getterId,
      required final int providerId,
      required final int homeId,
      required final int dmId,
      required final int deposit}) = _$ProtectedDealGeneratorRequestImpl;

  factory _ProtectedDealGeneratorRequest.fromJson(Map<String, dynamic> json) =
      _$ProtectedDealGeneratorRequestImpl.fromJson;

  @override
  int get getterId;
  @override
  int get providerId;
  @override
  int get homeId;
  @override
  int get dmId;
  @override
  int get deposit;

  /// Create a copy of ProtectedDealGeneratorRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtectedDealGeneratorRequestImplCopyWith<
          _$ProtectedDealGeneratorRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
