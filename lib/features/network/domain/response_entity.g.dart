// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseEntity _$$_ResponseEntityFromJson(Map<String, dynamic> json) =>
    _$_ResponseEntity(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => Film.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      limit: json['limit'] as int?,
      page: json['page'] as int?,
      pages: json['pages'] as int?,
    );

Map<String, dynamic> _$$_ResponseEntityToJson(_$_ResponseEntity instance) =>
    <String, dynamic>{
      'docs': instance.docs,
      'total': instance.total,
      'limit': instance.limit,
      'page': instance.page,
      'pages': instance.pages,
    };
