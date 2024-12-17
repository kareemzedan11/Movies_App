class EndPoints {
  static const String populerEndPoint = "/3/trending/movie/day";
  static const String upcomingEndPoint = "/3/movie/upcoming";
  static const String topRatedEndPoint = "/3/movie/top_rated";
  static String categoryEndPoint({required String mediaType}) =>
      "/3/genre/$mediaType/list";
  static String movieDetailsEndPoint({required num movieId}) =>
      "/3/movie/$movieId";
  static String searchEndPoint = "/3/search/multi";
  static String filterEndPoint({required String mediaType}) =>
      "/3/discover/$mediaType";
  static String videoTrailler({required num movieId, required mediaType}) =>
      "/3/$mediaType/$movieId/videos";
  static String rating({required num movieId}) =>
      "/3/movie/$movieId/release_dates";
  static String topRatedSeriesEndPoint = "/3/tv/on_the_air";
  static String popularSeriesEndPoint = "/3/trending/tv/day";
  static String nowPlayingEndPoint = "/3/movie/now_playing";
  static String moviesReview({required num movieId}) =>
      "/3/movie/$movieId/reviews";
  static String seriesDetailsEndPoint({required num seriesId}) =>
      "/3/tv/$seriesId";
  static String simillerSeriesEndPoint({required num seriesId}) =>
      "/3/tv/$seriesId/similar";
  static String seriesSeasonEndPoint(
          {required num seriesId, required num seasonNumber}) =>
      "/3/tv/$seriesId/season/$seasonNumber";
  static String castEndPoint({required num movieId}) =>
      "/3/movie/$movieId/credits";
  static String seriesCastEndPoint = "";
  static String castMoviesAndSeriesEndPoint({required String castId}) =>
      "/3/person/$castId/combined_credits";
}
