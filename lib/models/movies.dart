class Movie {
  final String title;
  final int year;
  final String rated; // eg: "N/A"
  final DateTime releasedDate;
  final double runTime;
  final String genre;
  final String plot;
  final String director;
  final String writer;
  final String actors;
  final String language;
  final String posterImg;
  final String type; // eg: "movie"
  final double imdbRating;
  final int imdbVotes;

  static const defaultPostImg =
      'https://images.unsplash.com/photo-1603568301602-3924e87dc8d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';

  Movie({
    this.title,
    this.year,
    this.rated,
    this.releasedDate,
    this.runTime,
    this.genre,
    this.plot,
    this.director,
    this.writer,
    this.actors,
    this.language,
    this.posterImg,
    this.type,
    this.imdbRating,
    this.imdbVotes,
  });

  // semi-colon is to assign final fields before the body
  // is executed
  Movie.fromJson(Map<String, dynamic> json)
      : title = json['Title'],
        year = json['Year'].toInt(),
        rated = json['Rated'],
        releasedDate = DateTime.parse(json['Released']),
        runTime = json['Runtime'].split(' ')[0].toDouble(),
        genre = json['Genre'],
        plot = json['Plot'],
        director = json['Director'],
        writer = json['Writer'],
        actors = json['Actors'],
        language = json['Language'],
        posterImg = json['Poster'] ? json['Poster'] : Movie.defaultPostImg,
        type = json['Type'],
        imdbRating = json['imdbRating'].toDouble(),
        imdbVotes = json['imdbVotes'].toInt();
}
