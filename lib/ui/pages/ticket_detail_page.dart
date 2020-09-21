part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToMainPage());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Ticket Details",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          // color: Colors.blueAccent,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(imageBaseUrl +
                                          'w342' +
                                          ticket.movieDetail.posterPath),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  ticket.movieDetail.title,
                                  style: blackTextFont.copyWith(fontSize: 18),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  ticket.movieDetail.genresAndLanguage,
                                  style: greyTextFont.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              // Container(
                              //   margin: EdgeInsets.symmetric(horizontal: 10),
                              //   child: Text(
                              //     "PG - 13",
                              //     style: greyTextFont.copyWith(
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.w400),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Booking ID",
                                      style: greyTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ticket.bookingCode,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Theater",
                                      style: greyTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(
                                        ticket.theater.name,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Date & Time",
                                      style: greyTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      ticket.time.dateAndTime,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Seats",
                                      style: greyTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.55,
                                      child: Text(
                                        ticket.seatsInString,
                                        textAlign: TextAlign.end,
                                        style: whiteNumberFont.copyWith(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Name",
                                          style: greyTextFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * (defaultMargin + 15) -
                                              100,
                                          child: Text(
                                            ticket.name,
                                            style: whiteTextFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Paid",
                                          style: greyTextFont.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * (defaultMargin + 15) -
                                              100,
                                          child: Text(
                                            NumberFormat.currency(
                                                    locale: 'id_ID',
                                                    decimalDigits: 0,
                                                    symbol: 'IDR ')
                                                .format(55000),
                                            style: whiteNumberFont.copyWith(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Divider(
                                  color: Color(0xFFE4E4E4),
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
