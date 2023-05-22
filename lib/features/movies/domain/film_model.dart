import 'package:freezed_annotation/freezed_annotation.dart';

part 'film_model.freezed.dart';

part 'film_model.g.dart';

@Freezed()
class Film with _$Film {
  const factory Film({
    required int id,
    required String? name,
    required String? alternativeName,
    required String? enName,
    required List<String>? names,
    required String? type,
    required int? year,
    required String? description,
    required String? shortDescription,
    required String? logo,
    required String? poster,
    required String? backdrop,
    required double? rating,
    required int? votes,
    required int? movieLength,
    required List<String>? genres,
    required List<String>? countries,
  }) = _Film;

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
}
