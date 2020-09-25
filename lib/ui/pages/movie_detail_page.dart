part of 'pages.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  Widget build(BuildContext context) {
    MovieDetail movieDetail;
    List<Credit> credits;

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(color: acientColor1),
          SafeArea(
            child: Container(
              color: Colors.white,
            ),
          ),
          ListView(
            children: <Widget>[
              FutureBuilder(
                future: MovieServices.getDetails(movie),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    movieDetail = snapshot.data;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imageBaseUrl +
                                            "w1280" +
                                            movie.backdropPath ??
                                        movie.posterPath),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 181,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0, 1),
                                end: Alignment(0, 0.06),
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: defaultMargin),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black.withOpacity(0.04)),
                            child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToMainPage());
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 140, left: defaultMargin),
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(imageBaseUrl +
                                          "w780" +
                                          movie.backdropPath ??
                                      movie.posterPath),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            height: 80,
                            margin: EdgeInsets.fromLTRB(
                                defaultMargin + 110, 156, defaultMargin, 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  movie.title,
                                  style: blackTextFont.copyWith(fontSize: 18),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                // note: GENRE
                                (snapshot.hasData)
                                    ? Text(
                                        movieDetail.genresAndLanguage,
                                        style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )
                                    : SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: SpinKitFadingCircle(
                                          color: acientColor3,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      // note: CREDITS
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: defaultMargin, bottom: 12),
                            child: Text(
                              "Cast & Crew",
                              style: blackTextFont.copyWith(fontSize: 14),
                            )),
                      ),
                      FutureBuilder(
                          future: MovieServices.getCredits(movie.id),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              credits = snapshot.data;
                              return SizedBox(
                                height: 115,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: credits.length,
                                    itemBuilder: (_, index) => Container(
                                        margin: EdgeInsets.only(
                                            left: (index == 0)
                                                ? defaultMargin
                                                : 0,
                                            right: (index == credits.length - 1)
                                                ? defaultMargin
                                                : 16),
                                        child: CreditCard(credits[index]))),
                              );
                            } else {
                              return SizedBox(
                                  height: 50,
                                  child: SpinKitFadingCircle(
                                    color: acientColor1,
                                  ));
                            }
                          }),
                      // note: STORYLINE
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 24, defaultMargin, 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Overview",
                            style: blackTextFont,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 0, defaultMargin, 30),
                        child: Text(
                          movie.overview,
                          style: greyTextFont.copyWith(
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      // note: BUTTON
                      Center(
                        child: Container(
                          width: 250,
                          height: 46,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: mainColor,
                            child: Text(
                              "Continue to Book",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () {
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToSelectSchedulePage(movieDetail));
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: defaultMargin)
                    ],
                  );
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
