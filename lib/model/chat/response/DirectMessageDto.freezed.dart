// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DirectMessageDto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectMessageResponse _$DirectMessageResponseFromJson(
    Map<String, dynamic> json) {
  return _DirectMessageDto.fromJson(json);
}

/// @nodoc
mixin _$DirectMessageResponse {
  int get senderId => throw _privateConstructorUsedError;
  int get receiverId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get sentAt => throw _privateConstructorUsedError;
  int get isDeal => throw _privateConstructorUsedError;
  DealState? get dealState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectMessageResponseCopyWith<DirectMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectMessageResponseCopyWith<$Res> {
  factory $DirectMessageResponseCopyWith(DirectMessageResponse value,
          $Res Function(DirectMessageResponse) then) =
      _$DirectMessageResponseCopyWithImpl<$Res, DirectMessageResponse>;
  @useResult
  $Res call(
      {int senderId,
      int receiverId,
      String message,
      String? sentAt,
      int isDeal,
      DealState? dealState});
}

/// @nodoc
class _$DirectMessageResponseCopyWithImpl<$Res,
        $Val extends DirectMessageResponse>
    implements $DirectMessageResponseCopyWith<$Res> {
  _$DirectMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? receiverId = null,
    Object? message = null,
    Object? sentAt = freezed,
    Object? isDeal = null,
    Object? dealState = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeal: null == isDeal
          ? _value.isDeal
          : isDeal // ignore: cast_nullable_to_non_nullable
              as int,
      dealState: freezed == dealState
          ? _value.dealState
          : dealState // ignore: cast_nullable_to_non_nullable
              as DealState?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectMessageDtoImplCopyWith<$Res>
    implements $DirectMessageResponseCopyWith<$Res> {
  factory _$$DirectMessageDtoImplCopyWith(_$DirectMessageDtoImpl value,
          $Res Function(_$DirectMessageDtoImpl) then) =
      __$$DirectMessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int senderId,
      int receiverId,
      String message,
      String? sentAt,
      int isDeal,
      DealState? dealState});
}

/// @nodoc
class __$$DirectMessageDtoImplCopyWithImpl<$Res>
    extends _$DirectMessageResponseCopyWithImpl<$Res, _$DirectMessageDtoImpl>
    implements _$$DirectMessageDtoImplCopyWith<$Res> {
  __$$DirectMessageDtoImplCopyWithImpl(_$DirectMessageDtoImpl _value,
      $Res Function(_$DirectMessageDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? receiverId = null,
    Object? message = null,
    Object? sentAt = freezed,
    Object? isDeal = null,
    Object? dealState = freezed,
  }) {
    return _then(_$DirectMessageDtoImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeal: null == isDeal
          ? _value.isDeal
          : isDeal // ignore: cast_nullable_to_non_nullable
              as int,
      dealState: freezed == dealState
          ? _value.dealState
          : dealState // ignore: cast_nullable_to_non_nullable
              as DealState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectMessageDtoImpl implements _DirectMessageDto {
  _$DirectMessageDtoImpl(
      {required this.senderId,
      required this.receiverId,
      required this.message,
      required this.sentAt,
      required this.isDeal,
      required this.dealState});

  factory _$DirectMessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectMessageDtoImplFromJson(json);

  @override
  final int senderId;
  @override
  final int receiverId;
  @override
  final String message;
  @override
  final String? sentAt;
  @override
  final int isDeal;
  @override
  final DealState? dealState;

  @override
  String toString() {
    return 'DirectMessageResponse(senderId: $senderId, receiverId: $receiverId, message: $message, sentAt: $sentAt, isDeal: $isDeal, dealState: $dealState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectMessageDtoImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.isDeal, isDeal) || other.isDeal == isDeal) &&
            (identical(other.dealState, dealState) ||
                other.dealState == dealState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, senderId, receiverId, message, sentAt, isDeal, dealState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectMessageDtoImplCopyWith<_$DirectMessageDtoImpl> get copyWith =>
      __$$DirectMessageDtoImplCopyWithImpl<_$DirectMessageDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectMessageDtoImplToJson(
      this,
    );
  }
}

abstract class _DirectMessageDto implements DirectMessageResponse {
  factory _DirectMessageDto(
      {required final int senderId,
      required final int receiverId,
      required final String message,
      required final String? sentAt,
      required final int isDeal,
      required final DealState? dealState}) = _$DirectMessageDtoImpl;

  factory _DirectMessageDto.fromJson(Map<String, dynamic> json) =
      _$DirectMessageDtoImpl.fromJson;

  @override
  int get senderId;
  @override
  int get receiverId;
  @override
  String get message;
  @override
  String? get sentAt;
  @override
  int get isDeal;
  @override
  DealState? get dealState;
  @override
  @JsonKey(ignore: true)
  _$$DirectMessageDtoImplCopyWith<_$DirectMessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
