class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  static List<String> categoriesMovieImagesList = [
    "https://thegoldenstar.net/wp-content/uploads/2018/07/12720668_web1_SKYSCRAPER_Movie_01.jpg",
    "https://img.freepik.com/free-photo/hiking-men-conquer-mountain-peak-adventure-awaits-generative-ai_188544-7877.jpg",
    "https://ca-times.brightspotcdn.com/dims4/default/9e2cb10/2147483647/strip/true/crop/2048x890+0+0/resize/1200x521!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F75%2F8d%2F7aaa9a6c63064764340ae45c2c4e%2Fla-et-ct-box-office-minions-20150712-001",
    "https://image.tmdb.org/t/p/w500/en9bAOhdPXZJfx2xTf1WL5d1T5v.jpg",
    "https://www.pluggedin.com/wp-content/uploads/2019/12/sherlock-holmes.jpg",
    "https://www.qna.org.qa/en/News-Area/News/2023-03/29/qnacdn.azureedge.net/-/media/Project/QNA/QNAImages/2023-03/29/QNA_BANDA_29_3_23.jpg?h=630&la=en&w=840&modified=20230329091214",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3N3mSHdaNtv3GRneWoKrkMy1nK5VAN8FIhg&s",
    "https://w0.peakpx.com/wallpaper/390/815/HD-wallpaper-the-addams-family-2019-movie.jpg",
    "https://images3.alphacoders.com/674/674346.jpg",
    "https://images4.alphacoders.com/131/1314571.jpeg",
    "https://w0.peakpx.com/wallpaper/661/947/HD-wallpaper-it-horror-movie-2017-high-quality.jpg",
    "https://www.undergroundpress.co.za/images/content-4/music-film/music--film-editing-wallpaper.jpg",
    "https://c4.wallpaperflare.com/wallpaper/966/624/5/movie-escape-room-deborah-ann-woll-escape-room-movie-jay-ellis-hd-wallpaper-preview.jpg",
    "https://w0.peakpx.com/wallpaper/672/478/HD-wallpaper-titanic-titanic-movies-love-couple-kiss.jpg",
    "https://e1.pxfuel.com/desktop-wallpaper/374/979/desktop-wallpaper-sci-fi-movie-science-fiction-movies.jpg",
    "https://c4.wallpaperflare.com/wallpaper/355/966/399/wednesday-addams-wednesday-tv-series-movie-characters-jenna-ortega-emma-myers-hd-wallpaper-preview.jpg",
    "https://t3.ftcdn.net/jpg/06/35/83/58/360_F_635835828_UyU7sn9lhk7zXSF5JA21qr0HO3KPXeLs.jpg",
    "https://wallpapercave.com/wp/wp1849808.jpg",
    "https://wallpapers.com/images/hd/western-coach-drivers-3mfsgw7rvego3t9c.jpg",
  ];
  static List<String> categoriesSeriesImagesList = [
    "https://thegoldenstar.net/wp-content/uploads/2018/07/12720668_web1_SKYSCRAPER_Movie_01.jpg",
    "https://ca-times.brightspotcdn.com/dims4/default/9e2cb10/2147483647/strip/true/crop/2048x890+0+0/resize/1200x521!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F75%2F8d%2F7aaa9a6c63064764340ae45c2c4e%2Fla-et-ct-box-office-minions-20150712-001",     "https://image.tmdb.org/t/p/w500/en9bAOhdPXZJfx2xTf1WL5d1T5v.jpg",
    "https://www.pluggedin.com/wp-content/uploads/2019/12/sherlock-holmes.jpg",
    "https://www.qna.org.qa/en/News-Area/News/2023-03/29/qnacdn.azureedge.net/-/media/Project/QNA/QNAImages/2023-03/29/QNA_BANDA_29_3_23.jpg?h=630&la=en&w=840&modified=20230329091214",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3N3mSHdaNtv3GRneWoKrkMy1nK5VAN8FIhg&s",
    "https://w0.peakpx.com/wallpaper/390/815/HD-wallpaper-the-addams-family-2019-movie.jpg",
    //---------kids
    "https://img.freepik.com/free-psd/kawaii-summer-background_23-2150526742.jpg",
    "https://c4.wallpaperflare.com/wallpaper/966/624/5/movie-escape-room-deborah-ann-woll-escape-room-movie-jay-ellis-hd-wallpaper-preview.jpg",
    //---------news
    "https://img.freepik.com/free-vector/gradient-breaking-news-background_23-2151142406.jpg",
    //---------Reality
    "https://www.shutterstock.com/image-vector/reality-tv-word-cloud-isolated-260nw-1787976707.jpg",
    "https://e1.pxfuel.com/desktop-wallpaper/374/979/desktop-wallpaper-sci-fi-movie-science-fiction-movies.jpg",
    //---------Soap
    "https://debravega.wordpress.com/wp-content/uploads/2013/01/fotolia_38761865_xs.jpg",
    //---------Talk
    "https://img.freepik.com/free-vector/hand-drawn-talk-show-background_23-2149981113.jpg",
    "https://wallpapercave.com/wp/wp1849808.jpg",
    "https://wallpapers.com/images/hd/western-coach-drivers-3mfsgw7rvego3t9c.jpg",
  ];
}
