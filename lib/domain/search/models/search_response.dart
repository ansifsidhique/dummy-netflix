import 'package:json_annotation/json_annotation.dart';

import '../../../core/strings.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: "results")
  List<SearchResultData> results;

  SearchResponse({this.results = const []});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
@JsonSerializable()
class SearchResultData {
  int id;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'poster_path')
  String posterPath;
  String get posterImageUrl=>"$kimageAppentUrl$posterPath";
  SearchResultData(
    this.id,
    this.originalTitle,
    this.posterPath,
  );

  factory SearchResultData.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
