import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_entity.freezed.dart';

part 'response_entity.g.dart';

@Freezed()
class ResponseEntity with _$ResponseEntity {
  const factory ResponseEntity({
    required List<Film>? docs,
    required int? total,
    required int? limit,
    required int? page,
    required int? pages,
  }) = _ResponseEntity;

  factory ResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ResponseEntityFromJson(json);
}
