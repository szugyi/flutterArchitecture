class Movie {
  Movie(
      {this.id,
      this.title,
      this.originalTitle,
      this.genre,
      this.budget,
      this.revenue,
      this.posterImage,
      this.coverImage,
      this.releaseDate});

  final int id;
  final String title;
  final String originalTitle;
  final String genre;
  final double budget;
  final double revenue;
  final String posterImage;
  final String coverImage;
  final String releaseDate;
}
