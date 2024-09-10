// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DirectMessageRoomListDto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectMessageRoomListResponse _$DirectMessageRoomListResponseFromJson(
    Map<String, dynamic> json) {
  return _DirectMessageRoomListDto.fromJson(json);
}

/// @nodoc
mixin _$DirectMessageRoomListResponse {
  int get id => throw _privateConstructorUsedError;
  int get otherUserId => throw _privateConstructorUsedError;
  String get userNickname => throw _privateConstructorUsedError;
  String? get userProfileUrl => throw _privateConstructorUsedError;
  int get progressHomeId => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  DateTime get lastSendDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectMessageRoomListResponseCopyWith<DirectMessageRoomListResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageRoomListResponseCopyWith<$Res> {
  factory $DirectMessageRoomListResponseCopyWith(
          DirectMessageRoomListResponse value,
          $Res Function(DirectMessageRoomListResponse) then) =
      _$DirectMessageRoomListResponseCopyWithImpl<$Res,
          DirectMessageRoomListResponse>;
  @useResult
  $Res call(
      {int id,
      int otherUserId,
      String userNickname,
      String? userProfileUrl,
      int progressHomeId,
      String lastMessage,
      DateTime lastSendDateTime});
}

/// @nodoc
class _$DirectMessageRoomListResponseCopyWithImpl<$Res,
        $Val extends DirectMessageRoomListResponse>
    implements $DirectMessageRoomListResponseCopyWith<$Res> {
  _$DirectMessageRoomListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? otherUserId = null,
    Object? userNickname = null,
    Object? userProfileUrl = freezed,
    Object? progressHomeId = null,
    Object? lastMessage = null,
    Object? lastSendDateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as int,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileUrl: freezed == userProfileUrl
          ? _value.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      progressHomeId: null == progressHomeId
          ? _value.progressHomeId
          : progressHomeId // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastSendDateTime: null == lastSendDateTime
          ? _value.lastSendDateTime
          : lastSendDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMessageRoomListDtoImplCopyWith<$Res>
    implements $DirectMessageRoomListResponseCopyWith<$Res> {
  factory _$$DirectMessageRoomListDtoImplCopyWith(
          _$DirectMessageRoomListDtoImpl value,
          $Res Function(_$DirectMessageRoomListDtoImpl) then) =
      __$$DirectMessageRoomListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int otherUserId,
      String userNickname,
      String? userProfileUrl,
      int progressHomeId,
      String lastMessage,
      DateTime lastSendDateTime});
}

/// @nodoc
class __$$DirectMessageRoomListDtoImplCopyWithImpl<$Res>
    extends _$DirectMessageRoomListResponseCopyWithImpl<$Res,
        _$DirectMessageRoomListDtoImpl>
    implements _$$DirectMessageRoomListDtoImplCopyWith<$Res> {
  __$$DirectMessageRoomListDtoImplCopyWithImpl(
      _$DirectMessageRoomListDtoImpl _value,
      $Res Function(_$DirectMessageRoomListDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? otherUserId = null,
    Object? userNickname = null,
    Object? userProfileUrl = freezed,
    Object? progressHomeId = null,
    Object? lastMessage = null,
    Object? lastSendDateTime = null,
  }) {
    return _then(_$DirectMessageRoomListDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      otherUserId: null == otherUserId
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as int,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileUrl: freezed == userProfileUrl
          ? _value.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      progressHomeId: null == progressHomeId
          ? _value.progressHomeId
          : progressHomeId // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastSendDateTime: null == lastSendDateTime
          ? _value.lastSendDateTime
          : lastSendDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectMessageRoomListDtoImpl implements _DirectMessageRoomListDto {
  _$DirectMessageRoomListDtoImpl(
      {required this.id,
      required this.otherUserId,
      required this.userNickname,
      required this.userProfileUrl,
      required this.progressHomeId,
      required this.lastMessage,
      required this.lastSendDateTime});

  factory _$DirectMessageRoomListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectMessageRoomListDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int otherUserId;
  @override
  final String userNickname;
  @override
  final String? userProfileUrl;
  @override
  final int progressHomeId;
  @override
  final String lastMessage;
  @override
  final DateTime lastSendDateTime;

  @override
  String toString() {
    return 'DirectMessageRoomListResponse(id: $id, otherUserId: $otherUserId, userNickname: $userNickname, userProfileUrl: $userProfileUrl, progressHomeId: $progressHomeId, lastMessage: $lastMessage, lastSendDateTime: $lastSendDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMessageRoomListDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.otherUserId, otherUserId) ||
                other.otherUserId == otherUserId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname) &&
            (identical(other.userProfileUrl, userProfileUrl) ||
                other.userProfileUrl == userProfileUrl) &&
            (identical(other.progressHomeId, progressHomeId) ||
                other.progressHomeId == progressHomeId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastSendDateTime, lastSendDateTime) ||
                other.lastSendDateTime == lastSendDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, otherUserId, userNickname,
      userProfileUrl, progressHomeId, lastMessage, lastSendDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectMessageRoomListDtoImplCopyWith<_$DirectMessageRoomListDtoImpl>
      get copyWith => __$$DirectMessageRoomListDtoImplCopyWithImpl<
          _$DirectMessageRoomListDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectMessageRoomListDtoImplToJson(
      this,
    );
  }
}

abstract class _DirectMessageRoomListDto
    implements DirectMessageRoomListResponse {
  factory _DirectMessageRoomListDto(
          {required final int id,
          required final int otherUserId,
          required final String userNickname,
          required final String? userProfileUrl,
          required final int progressHomeId,
          required final String lastMessage,
          required final DateTime lastSendDateTime}) =
      _$DirectMessageRoomListDtoImpl;

  factory _DirectMessageRoomListDto.fromJson(Map<String, dynamic> json) =
      _$DirectMessageRoomListDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get otherUserId;
  @override
  String get userNickname;
  @override
  String? get userProfileUrl;
  @override
  int get progressHomeId;
  @override
  String get lastMessage;
  @override
  DateTime get lastSendDateTime;
  @override
  @JsonKey(ignore: true)
  _$$DirectMessageRoomListDtoImplCopyWith<_$DirectMessageRoomListDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
