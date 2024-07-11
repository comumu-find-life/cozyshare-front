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

DirectMessageRoomListDto _$DirectMessageRoomListDtoFromJson(
    Map<String, dynamic> json) {
  return _DirectMessageRoomListDto.fromJson(json);
}

/// @nodoc
mixin _$DirectMessageRoomListDto {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get userNickname => throw _privateConstructorUsedError;
  String? get userProfileUrl => throw _privateConstructorUsedError;
  int get progressHomeId => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectMessageRoomListDtoCopyWith<DirectMessageRoomListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageRoomListDtoCopyWith<$Res> {
  factory $DirectMessageRoomListDtoCopyWith(DirectMessageRoomListDto value,
          $Res Function(DirectMessageRoomListDto) then) =
      _$DirectMessageRoomListDtoCopyWithImpl<$Res, DirectMessageRoomListDto>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String userNickname,
      String? userProfileUrl,
      int progressHomeId,
      String lastMessage});
}

/// @nodoc
class _$DirectMessageRoomListDtoCopyWithImpl<$Res,
        $Val extends DirectMessageRoomListDto>
    implements $DirectMessageRoomListDtoCopyWith<$Res> {
  _$DirectMessageRoomListDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userNickname = null,
    Object? userProfileUrl = freezed,
    Object? progressHomeId = null,
    Object? lastMessage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMessageRoomListDtoImplCopyWith<$Res>
    implements $DirectMessageRoomListDtoCopyWith<$Res> {
  factory _$$DirectMessageRoomListDtoImplCopyWith(
          _$DirectMessageRoomListDtoImpl value,
          $Res Function(_$DirectMessageRoomListDtoImpl) then) =
      __$$DirectMessageRoomListDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String userNickname,
      String? userProfileUrl,
      int progressHomeId,
      String lastMessage});
}

/// @nodoc
class __$$DirectMessageRoomListDtoImplCopyWithImpl<$Res>
    extends _$DirectMessageRoomListDtoCopyWithImpl<$Res,
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
    Object? userId = null,
    Object? userNickname = null,
    Object? userProfileUrl = freezed,
    Object? progressHomeId = null,
    Object? lastMessage = null,
  }) {
    return _then(_$DirectMessageRoomListDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectMessageRoomListDtoImpl implements _DirectMessageRoomListDto {
  _$DirectMessageRoomListDtoImpl(
      {required this.id,
      required this.userId,
      required this.userNickname,
      required this.userProfileUrl,
      required this.progressHomeId,
      required this.lastMessage});

  factory _$DirectMessageRoomListDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectMessageRoomListDtoImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String userNickname;
  @override
  final String? userProfileUrl;
  @override
  final int progressHomeId;
  @override
  final String lastMessage;

  @override
  String toString() {
    return 'DirectMessageRoomListDto(id: $id, userId: $userId, userNickname: $userNickname, userProfileUrl: $userProfileUrl, progressHomeId: $progressHomeId, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMessageRoomListDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname) &&
            (identical(other.userProfileUrl, userProfileUrl) ||
                other.userProfileUrl == userProfileUrl) &&
            (identical(other.progressHomeId, progressHomeId) ||
                other.progressHomeId == progressHomeId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userNickname,
      userProfileUrl, progressHomeId, lastMessage);

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

abstract class _DirectMessageRoomListDto implements DirectMessageRoomListDto {
  factory _DirectMessageRoomListDto(
      {required final int id,
      required final int userId,
      required final String userNickname,
      required final String? userProfileUrl,
      required final int progressHomeId,
      required final String lastMessage}) = _$DirectMessageRoomListDtoImpl;

  factory _DirectMessageRoomListDto.fromJson(Map<String, dynamic> json) =
      _$DirectMessageRoomListDtoImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get userNickname;
  @override
  String? get userProfileUrl;
  @override
  int get progressHomeId;
  @override
  String get lastMessage;
  @override
  @JsonKey(ignore: true)
  _$$DirectMessageRoomListDtoImplCopyWith<_$DirectMessageRoomListDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
