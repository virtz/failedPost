class Genre {
 final int id;
  final String genreName;

  Genre({this.id, this.genreName});


factory Genre.fromJson(Map<String, dynamic> json){
  return new Genre(
    id:json['id'],
    genreName: json['name'],
  );
}
}