class Movie {
  final String title;
  final String year;
  final String posterImg;
  final String type; // eg: "movie"

  Movie({this.title, this.year, this.posterImg, this.type});

  // semi-colon is to assign final fields before the body
  // is executed
  Movie.fromJson(Map<String, dynamic> data)
      : this.title = data['Title'] != null ? data['Title'] : 'No title',
        this.year = data['Year'] != null ? data['Year'] : 'No year',
        this.posterImg = data['Poster'] != 'N/A'
            ? data['Poster']
            : 'https://images.unsplash.com/photo-1481278403982-f2d9f387cdcc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        this.type = data['Type'] != null ? data['Type'] : 'No type';
}
