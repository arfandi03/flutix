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
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          // color: acientColor1,
                          image: DecorationImage(
                              image: NetworkImage(imageBaseUrl +
                                  "w780" +
                                  movie.backdropPath.toString()),
                              fit: BoxFit.cover),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Container(
                          margin: EdgeInsets.only(top: 40),
                          alignment: Alignment.topLeft,
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
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(imageBaseUrl +
                                    "w780" +
                                    movie.backdropPath.toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(defaultMargin + 120,
                            defaultMargin + 170, defaultMargin, defaultMargin),
                        child: FutureBuilder(
                          future: MovieServices.getDetails(movie),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              movieDetail = snapshot.data;
                              return FutureBuilder(
                                future: MovieServices.getCredits(movie.id),
                                builder: (_, snapshot) {
                                  if (snapshot.hasData) {
                                    credits = snapshot.data;
                                    return Column(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(movieDetail.title),
                                        Text(movieDetail.genresAndLanguage),
                                      ],
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: FutureBuilder(
                    future: MovieServices.getDetails(movie),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        movieDetail = snapshot.data;
                        return FutureBuilder(
                          future: MovieServices.getCredits(movie.id),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              credits = snapshot.data;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(movieDetail.title),
                                  Text(movieDetail.genresAndLanguage),
                                  Column(
                                    children: credits
                                        .map((e) => Text(e.name))
                                        .toList(),
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
                Container(
                  width: 200,
                  height: 46,
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  child: RaisedButton(
                    child: Text(
                      "Continue to Book",
                      style: whiteNumberFont.copyWith(fontSize: 16),
                    ),
                    color: mainColor,
                    onPressed: () {
                      context
                          .bloc<PageBloc>()
                          .add(GoToSelectSchedulePage(movieDetail));
                    },
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
