// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DirectMessageRoomInfoDto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectMessageRoomInfoDto _$DirectMessageRoomInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _DirectMessageRoomInfoDto.fromJson(json);
}

/// @nodoc
mixin _$DirectMessageRoomInfoDto {
  int get id => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;

  /// Serializes this DirectMessageRoomInfoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectMessageRoomInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectMessageRoomInfoDtoCopyWith<DirectMessageRoomInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageRoomInfoDtoCopyWith<$Res> {
  factory $DirectMessageRoomInfoDtoCopyWith(DirectMessageRoomInfoDto value,
          $Res Function(DirectMessageRoomInfoDto) then) =
      _$DirectMessageRoomInfoDtoCopyWithImpl<$Res, DirectMessageRoomInfoDto>;
  @useResult
  $Res call(
      {int id,
      int senderId,
      String senderName,
      int receiverId,
      String receiverName});
}

/// @nodoc
class _$DirectMessageRoomInfoDtoCopyWithImpl<$Res,
        $Val extends DirectMessageRoomInfoDto>
    implements $DirectMessageRoomInfoDtoCopyWith<$Res> {
  _$DirectMessageRoomInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectMessageRoomInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? receiverId = null,
    Object? receiverName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMessageRoomInfoDtoImplCopyWith<$Res>
    implements $DirectMessageRoomInfoDtoCopyWith<$Res> {
  factory _$$DirectMessageRoomInfoDtoImplCopyWith(
          _$DirectMessageRoomInfoDtoImpl value,
          $Res Function(_$DirectMessageRoomInfoDtoImpl) then) =
      __$$DirectMessageRoomInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int senderId,
      String senderName,
      int receiverId,
      String receiverName});
}

/// @nodoc
class __$$DirectMessageRoomInfoDtoImplCopyWithImpl<$Res>
    extends _$DirectMessageRoomInfoDtoCopyWithImpl<$Res,
        _$DirectMessageRoomInfoDtoImpl>
    implements _$$DirectMessageRoomInfoDtoImplCopyWith<$Res> {
  __$$DirectMessageRoomInfoDtoImplCopyWithImpl(
      _$DirectMessageRoomInfoDtoImpl _value,
      $Res Function(_$DirectMessageRoomInfoDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectMessageRoomInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderName = null,
    Object? receiverId = null,
    Object? receiverName = null,
  }) {
    return _then(_$DirectMessageRoomInfoDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectMessageRoomInfoDtoImpl implements _DirectMessageRoomInfoDto {
  _$DirectMessageRoomInfoDtoImpl(
      {required this.id,
      required this.senderId,
      required this.senderName,
      required this.receiverId,
      required this.receiverName});

  factory _$DirectMessageRoomInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectMessageRoomInfoDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int senderId;
  @override
  final String senderName;
  @override
  final int receiverId;
  @override
  final String receiverName;

  @override
  String toString() {
    return 'DirectMessageRoomInfoDto(id: $id, senderId: $senderId, senderName: $senderName, receiverId: $receiverId, receiverName: $receiverName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMessageRoomInfoDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, senderId, senderName, receiverId, receiverName);

  /// Create a copy of DirectMessageRoomInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectMessageRoomInfoDtoImplCopyWith<_$DirectMessageRoomInfoDtoImpl>
      get copyWith => __$$DirectMessageRoomInfoDtoImplCopyWithImpl<
          _$DirectMessageRoomInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectMessageRoomInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _DirectMessageRoomInfoDto implements DirectMessageRoomInfoDto {
  factory _DirectMessageRoomInfoDto(
      {required final int id,
      required final int senderId,
      required final String senderName,
      required final int receiverId,
      required final String receiverName}) = _$DirectMessageRoomInfoDtoImpl;

  factory _DirectMessageRoomInfoDto.fromJson(Map<String, dynamic> json) =
      _$DirectMessageRoomInfoDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get senderId;
  @override
  String get senderName;
  @override
  int get receiverId;
  @override
  String get receiverName;

  /// Create a copy of DirectMessageRoomInfoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectMessageRoomInfoDtoImplCopyWith<_$DirectMessageRoomInfoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
