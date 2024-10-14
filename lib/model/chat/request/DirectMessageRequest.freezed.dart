// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DirectMessageRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectMessageRequest _$DirectMessageRequestFromJson(Map<String, dynamic> json) {
  return _DirectMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$DirectMessageRequest {
  int get senderId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get isDeal => throw _privateConstructorUsedError;
  int? get dealId => throw _privateConstructorUsedError;
  String? get dealState => throw _privateConstructorUsedError;

  /// Serializes this DirectMessageRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectMessageRequestCopyWith<DirectMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageRequestCopyWith<$Res> {
  factory $DirectMessageRequestCopyWith(DirectMessageRequest value,
          $Res Function(DirectMessageRequest) then) =
      _$DirectMessageRequestCopyWithImpl<$Res, DirectMessageRequest>;
  @useResult
  $Res call(
      {int senderId,
      String roomId,
      int receiverId,
      String message,
      int isDeal,
      int? dealId,
      String? dealState});
}

/// @nodoc
class _$DirectMessageRequestCopyWithImpl<$Res,
        $Val extends DirectMessageRequest>
    implements $DirectMessageRequestCopyWith<$Res> {
  _$DirectMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? roomId = null,
    Object? receiverId = null,
    Object? message = null,
    Object? isDeal = null,
    Object? dealId = freezed,
    Object? dealState = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isDeal: null == isDeal
          ? _value.isDeal
          : isDeal // ignore: cast_nullable_to_non_nullable
              as int,
      dealId: freezed == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as int?,
      dealState: freezed == dealState
          ? _value.dealState
          : dealState // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMessageRequestImplCopyWith<$Res>
    implements $DirectMessageRequestCopyWith<$Res> {
  factory _$$DirectMessageRequestImplCopyWith(_$DirectMessageRequestImpl value,
          $Res Function(_$DirectMessageRequestImpl) then) =
      __$$DirectMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int senderId,
      String roomId,
      int receiverId,
      String message,
      int isDeal,
      int? dealId,
      String? dealState});
}

/// @nodoc
class __$$DirectMessageRequestImplCopyWithImpl<$Res>
    extends _$DirectMessageRequestCopyWithImpl<$Res, _$DirectMessageRequestImpl>
    implements _$$DirectMessageRequestImplCopyWith<$Res> {
  __$$DirectMessageRequestImplCopyWithImpl(_$DirectMessageRequestImpl _value,
      $Res Function(_$DirectMessageRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? roomId = null,
    Object? receiverId = null,
    Object? message = null,
    Object? isDeal = null,
    Object? dealId = freezed,
    Object? dealState = freezed,
  }) {
    return _then(_$DirectMessageRequestImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isDeal: null == isDeal
          ? _value.isDeal
          : isDeal // ignore: cast_nullable_to_non_nullable
              as int,
      dealId: freezed == dealId
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as int?,
      dealState: freezed == dealState
          ? _value.dealState
          : dealState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectMessageRequestImpl implements _DirectMessageRequest {
  _$DirectMessageRequestImpl(
      {required this.senderId,
      required this.roomId,
      required this.receiverId,
      required this.message,
      required this.isDeal,
      required this.dealId,
      required this.dealState});

  factory _$DirectMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectMessageRequestImplFromJson(json);

  @override
  final int senderId;
  @override
  final String roomId;
  @override
  final int receiverId;
  @override
  final String message;
  @override
  final int isDeal;
  @override
  final int? dealId;
  @override
  final String? dealState;

  @override
  String toString() {
    return 'DirectMessageRequest(senderId: $senderId, roomId: $roomId, receiverId: $receiverId, message: $message, isDeal: $isDeal, dealId: $dealId, dealState: $dealState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMessageRequestImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isDeal, isDeal) || other.isDeal == isDeal) &&
            (identical(other.dealId, dealId) || other.dealId == dealId) &&
            (identical(other.dealState, dealState) ||
                other.dealState == dealState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, senderId, roomId, receiverId,
      message, isDeal, dealId, dealState);

  /// Create a copy of DirectMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectMessageRequestImplCopyWith<_$DirectMessageRequestImpl>
      get copyWith =>
          __$$DirectMessageRequestImplCopyWithImpl<_$DirectMessageRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectMessageRequestImplToJson(
      this,
    );
  }
}

abstract class _DirectMessageRequest implements DirectMessageRequest {
  factory _DirectMessageRequest(
      {required final int senderId,
      required final String roomId,
      required final int receiverId,
      required final String message,
      required final int isDeal,
      required final int? dealId,
      required final String? dealState}) = _$DirectMessageRequestImpl;

  factory _DirectMessageRequest.fromJson(Map<String, dynamic> json) =
      _$DirectMessageRequestImpl.fromJson;

  @override
  int get senderId;
  @override
  String get roomId;
  @override
  int get receiverId;
  @override
  String get message;
  @override
  int get isDeal;
  @override
  int? get dealId;
  @override
  String? get dealState;

  /// Create a copy of DirectMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectMessageRequestImplCopyWith<_$DirectMessageRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
