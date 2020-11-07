class Movie {
  final String title;
  final int year;
  final String posterImg;
  final String type; // eg: "movie"

  static const defaultPostImg =
      'https://images.unsplash.com/photo-1603568301602-3924e87dc8d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';

  Movie({
    this.title,
    this.year,
    this.posterImg,
    this.type,
  });

  // semi-colon is to assign final fields before the body
  // is executed
  Movie.fromJson(Map<String, dynamic> json)
      : title = json['Title'] ? json['Title'] : 'No title',
        year = json['Year'] ? json['Year'].toInt() : -1,
        posterImg = json['Poster'] ? json['Poster'] : Movie.defaultPostImg,
        type = json['Type'];
}
