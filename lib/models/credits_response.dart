import 'dart:convert';

class CreditsResponse {
  int id;
  List<Cast> cast;
  List<Cast> crew;

  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CreditsResponse.fromRawJson(String str) =>
      CreditsResponse.fromJson(json.decode(str));

  factory CreditsResponse.fromJson(Map<String, dynamic> json) =>
      CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );
}

class Cast {
  int? id;
  String? name;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;

  Cast({
    this.id,
    this.name,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
  });

  get fullProfilePath {
    if (this.profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500${this.profilePath}';
    }

    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["id"],
        name: json["name"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
