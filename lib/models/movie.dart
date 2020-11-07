class Movie {
  final String title;
  final String year;
  final String posterImg;
  final String type; // eg: "movie"

  Movie({
    this.title,
    this.year,
    this.posterImg,
    this.type,
  });

  // semi-colon is to assign final fields before the body
  // is executed
  Movie.fromJson(Map<String, dynamic> json)
      : title = json['Title'],
        year = json['Year'],
        posterImg = json['Poster'],
        type = json['Type'];
}
