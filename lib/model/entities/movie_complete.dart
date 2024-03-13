class MovieComplete {
  final int id;
  final String tittle;
  final String overview;
  final String date;
  final String posterUrl;
  final String lang;
  final double voteAverage;
  final int voteCount;
  final bool video;

  MovieComplete({
    required this.id,
    required this.tittle,
    required this.overview,
    required this.date,
    required this.posterUrl,
    required this.lang,
    required this.voteAverage,
    required this.voteCount,
    required this.video,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'overview': overview,
      'date': date,
      'poster_url': posterUrl,
      'lang': lang,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'video': video
    };
  }

  factory MovieComplete.fromMap(Map<String, dynamic> map) {
    return MovieComplete(
        id: map['id'] as int,
        tittle: map['tittle'] as String,
        overview: map['overview'] as String,
        date: map['date'] as String,
        posterUrl: map['poster_url'] as String,
        lang: map['lang'] as String,
        voteAverage: map['voteAverage'] as double,
        voteCount: map['voteCount'] as int,
        video: map['video'] as bool);
  }
}
