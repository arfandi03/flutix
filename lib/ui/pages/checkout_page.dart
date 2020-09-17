part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  final Ticket ticket;

  CheckoutPage(this.ticket);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    int total = 26500 * widget.ticket.seats.length;

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSelectSeatPage(widget.ticket));

        return;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: acientColor1,
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
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToSelectSeatPage(widget.ticket));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) {
                        UserProfile userProfile =
                            (userState as UserLoaded).userProfile;

                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "Checkout\nMovie",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 70,
                                  height: 90,
                                  margin: EdgeInsets.only(
                                      left: defaultMargin, right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        image: NetworkImage(imageBaseUrl +
                                            'w342' +
                                            widget
                                                .ticket.movieDetail.posterPath),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      child: Text(
                                        widget.ticket.movieDetail.title,
                                        style: blackTextFont.copyWith(
                                            fontSize: 18),
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          2 * defaultMargin -
                                          70 -
                                          20,
                                      margin: EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                        widget.ticket.movieDetail
                                            .genresAndLanguage,
                                        style: greyTextFont.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Booking ID",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.ticket.bookingCode,
                                    style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Theater",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.theater.name,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Date & Time",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.ticket.time.dateAndTime,
                                    style: whiteNumberFont.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Seats",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      widget.ticket.seatsInString,
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Price",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      "IDR 25.000 x ${widget.ticket.seats.length}",
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Fee",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      "IDR 1.500 x ${widget.ticket.seats.length}",
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Total",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(total),
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "My Wallet",
                                    style: greyTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      NumberFormat.currency(
                                              locale: 'id_ID',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(userProfile.balance),
                                      textAlign: TextAlign.end,
                                      style: whiteNumberFont.copyWith(
                                        color: userProfile.balance >= total
                                            ? Color(0xFF3E9D9D)
                                            : Color(0xFFFF5C83),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 46,
                              margin: EdgeInsets.only(top: 36, bottom: 50),
                              child: RaisedButton(
                                  elevation: 0,
                                  color: userProfile.balance >= total
                                      ? Color(0xFF3E9D9D)
                                      : mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    userProfile.balance >= total
                                        ? "Checkout Now"
                                        : "Top Up My Wallet",
                                    style: whiteTextFont.copyWith(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    if (userProfile.balance >= total) {
                                      FlutixTransaction transaction =
                                          FlutixTransaction(
                                              userID: userProfile.id,
                                              title: widget
                                                  .ticket.movieDetail.title,
                                              subtitle:
                                                  widget.ticket.theater.name,
                                              time: DateTime.now(),
                                              amount: -total,
                                              picture: widget.ticket.movieDetail
                                                  .posterPath);
                                      context.bloc<PageBloc>().add(
                                            GoToSuccessPage(
                                                widget.ticket.copyWith(
                                                    totalPrice: total),
                                                transaction),
                                          );
                                    } else {}
                                  }),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
