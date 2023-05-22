// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Film _$$_FilmFromJson(Map<String, dynamic> json) => _$_Film(
      id: json['id'] as int,
      name: json['name'] as String,
      alternativeName: json['alternativeName'] as String,
      enName: json['enName'] as String,
      names: (json['names'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
      year: json['year'] as int,
      description: json['description'] as String,
      shortDescription: json['shortDescription'] as String,
      logo: json['logo'] as String,
      poster: json['poster'] as String,
      backdrop: json['backdrop'] as String,
      rating: (json['rating'] as num).toDouble(),
      votes: json['votes'] as int,
      movieLength: json['movieLength'] as int,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      countries:
          (json['countries'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FilmToJson(_$_Film instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeName': instance.alternativeName,
      'enName': instance.enName,
      'names': instance.names,
      'type': instance.type,
      'year': instance.year,
      'description': instance.description,
      'shortDescription': instance.shortDescription,
      'logo': instance.logo,
      'poster': instance.poster,
      'backdrop': instance.backdrop,
      'rating': instance.rating,
      'votes': instance.votes,
      'movieLength': instance.movieLength,
      'genres': instance.genres,
      'countries': instance.countries,
    };
