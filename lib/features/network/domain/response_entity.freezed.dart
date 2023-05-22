// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseEntity _$ResponseEntityFromJson(Map<String, dynamic> json) {
  return _ResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$ResponseEntity {
  List<Film>? get docs => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseEntityCopyWith<ResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseEntityCopyWith<$Res> {
  factory $ResponseEntityCopyWith(
          ResponseEntity value, $Res Function(ResponseEntity) then) =
      _$ResponseEntityCopyWithImpl<$Res, ResponseEntity>;
  @useResult
  $Res call({List<Film>? docs, int? total, int? limit, int? page, int? pages});
}

/// @nodoc
class _$ResponseEntityCopyWithImpl<$Res, $Val extends ResponseEntity>
    implements $ResponseEntityCopyWith<$Res> {
  _$ResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = freezed,
    Object? total = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? pages = freezed,
  }) {
    return _then(_value.copyWith(
      docs: freezed == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Film>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseEntityCopyWith<$Res>
    implements $ResponseEntityCopyWith<$Res> {
  factory _$$_ResponseEntityCopyWith(
          _$_ResponseEntity value, $Res Function(_$_ResponseEntity) then) =
      __$$_ResponseEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Film>? docs, int? total, int? limit, int? page, int? pages});
}

/// @nodoc
class __$$_ResponseEntityCopyWithImpl<$Res>
    extends _$ResponseEntityCopyWithImpl<$Res, _$_ResponseEntity>
    implements _$$_ResponseEntityCopyWith<$Res> {
  __$$_ResponseEntityCopyWithImpl(
      _$_ResponseEntity _value, $Res Function(_$_ResponseEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docs = freezed,
    Object? total = freezed,
    Object? limit = freezed,
    Object? page = freezed,
    Object? pages = freezed,
  }) {
    return _then(_$_ResponseEntity(
      docs: freezed == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<Film>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseEntity implements _ResponseEntity {
  const _$_ResponseEntity(
      {required final List<Film>? docs,
      required this.total,
      required this.limit,
      required this.page,
      required this.pages})
      : _docs = docs;

  factory _$_ResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseEntityFromJson(json);

  final List<Film>? _docs;
  @override
  List<Film>? get docs {
    final value = _docs;
    if (value == null) return null;
    if (_docs is EqualUnmodifiableListView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? total;
  @override
  final int? limit;
  @override
  final int? page;
  @override
  final int? pages;

  @override
  String toString() {
    return 'ResponseEntity(docs: $docs, total: $total, limit: $limit, page: $page, pages: $pages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseEntity &&
            const DeepCollectionEquality().equals(other._docs, _docs) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_docs), total, limit, page, pages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseEntityCopyWith<_$_ResponseEntity> get copyWith =>
      __$$_ResponseEntityCopyWithImpl<_$_ResponseEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseEntityToJson(
      this,
    );
  }
}

abstract class _ResponseEntity implements ResponseEntity {
  const factory _ResponseEntity(
      {required final List<Film>? docs,
      required final int? total,
      required final int? limit,
      required final int? page,
      required final int? pages}) = _$_ResponseEntity;

  factory _ResponseEntity.fromJson(Map<String, dynamic> json) =
      _$_ResponseEntity.fromJson;

  @override
  List<Film>? get docs;
  @override
  int? get total;
  @override
  int? get limit;
  @override
  int? get page;
  @override
  int? get pages;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseEntityCopyWith<_$_ResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
