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
        posterImg = json['Poster'] != 'N/A'
            ? json['Poster']
            : 'https://images.unsplash.com/photo-1481278403982-f2d9f387cdcc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        type = json['Type'];
}
