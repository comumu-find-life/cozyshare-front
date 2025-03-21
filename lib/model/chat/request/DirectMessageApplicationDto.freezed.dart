// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DirectMessageApplicationDto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectMessageApplicationRequest _$DirectMessageApplicationRequestFromJson(
    Map<String, dynamic> json) {
  return _DirectMessageApplicationDto.fromJson(json);
}

/// @nodoc
mixin _$DirectMessageApplicationRequest {
  String get message => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  int get roomId => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;

  /// Serializes this DirectMessageApplicationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectMessageApplicationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectMessageApplicationRequestCopyWith<DirectMessageApplicationRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageApplicationRequestCopyWith<$Res> {
  factory $DirectMessageApplicationRequestCopyWith(
          DirectMessageApplicationRequest value,
          $Res Function(DirectMessageApplicationRequest) then) =
      _$DirectMessageApplicationRequestCopyWithImpl<$Res,
          DirectMessageApplicationRequest>;
  @useResult
  $Res call({String message, int receiverId, int roomId, int senderId});
}

/// @nodoc
class _$DirectMessageApplicationRequestCopyWithImpl<$Res,
        $Val extends DirectMessageApplicationRequest>
    implements $DirectMessageApplicationRequestCopyWith<$Res> {
  _$DirectMessageApplicationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectMessageApplicationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? receiverId = null,
    Object? roomId = null,
    Object? senderId = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMessageApplicationDtoImplCopyWith<$Res>
    implements $DirectMessageApplicationRequestCopyWith<$Res> {
  factory _$$DirectMessageApplicationDtoImplCopyWith(
          _$DirectMessageApplicationDtoImpl value,
          $Res Function(_$DirectMessageApplicationDtoImpl) then) =
      __$$DirectMessageApplicationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int receiverId, int roomId, int senderId});
}

/// @nodoc
class __$$DirectMessageApplicationDtoImplCopyWithImpl<$Res>
    extends _$DirectMessageApplicationRequestCopyWithImpl<$Res,
        _$DirectMessageApplicationDtoImpl>
    implements _$$DirectMessageApplicationDtoImplCopyWith<$Res> {
  __$$DirectMessageApplicationDtoImplCopyWithImpl(
      _$DirectMessageApplicationDtoImpl _value,
      $Res Function(_$DirectMessageApplicationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectMessageApplicationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? receiverId = null,
    Object? roomId = null,
    Object? senderId = null,
  }) {
    return _then(_$DirectMessageApplicationDtoImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectMessageApplicationDtoImpl
    implements _DirectMessageApplicationDto {
  _$DirectMessageApplicationDtoImpl(
      {required this.message,
      required this.receiverId,
      required this.roomId,
      required this.senderId});

  factory _$DirectMessageApplicationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DirectMessageApplicationDtoImplFromJson(json);

  @override
  final String message;
  @override
  final int receiverId;
  @override
  final int roomId;
  @override
  final int senderId;

  @override
  String toString() {
    return 'DirectMessageApplicationRequest(message: $message, receiverId: $receiverId, roomId: $roomId, senderId: $senderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMessageApplicationDtoImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, receiverId, roomId, senderId);

  /// Create a copy of DirectMessageApplicationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectMessageApplicationDtoImplCopyWith<_$DirectMessageApplicationDtoImpl>
      get copyWith => __$$DirectMessageApplicationDtoImplCopyWithImpl<
          _$DirectMessageApplicationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectMessageApplicationDtoImplToJson(
      this,
    );
  }
}

abstract class _DirectMessageApplicationDto
    implements DirectMessageApplicationRequest {
  factory _DirectMessageApplicationDto(
      {required final String message,
      required final int receiverId,
      required final int roomId,
      required final int senderId}) = _$DirectMessageApplicationDtoImpl;

  factory _DirectMessageApplicationDto.fromJson(Map<String, dynamic> json) =
      _$DirectMessageApplicationDtoImpl.fromJson;

  @override
  String get message;
  @override
  int get receiverId;
  @override
  int get roomId;
  @override
  int get senderId;

  /// Create a copy of DirectMessageApplicationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectMessageApplicationDtoImplCopyWith<_$DirectMessageApplicationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
