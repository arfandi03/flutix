part of 'pages.dart';

class TicketPage extends StatefulWidget {
  final bool isExpiredTiket;

  TicketPage({this.isExpiredTiket = false});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTikets;

  @override
  void initState() {
    super.initState();

    isExpiredTikets = widget.isExpiredTiket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // note : CONTENT
          BlocBuilder<TicketBloc, TicketState>(
            builder: (_, ticketState) => Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TicketViewer(isExpiredTikets
                  ? ticketState.tickets
                      .where((ticket) => ticket.time.isBefore(DateTime.now()))
                      .toList()
                  : ticketState.tickets
                      .where((ticket) => !ticket.time.isBefore(DateTime.now()))
                      .toList()),
            ),
          ),
          // note : HEADER
          Container(
            height: 113,
            color: acientColor1,
          ),
          SafeArea(
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 113,
                color: acientColor1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 24, bottom: 32),
                      child: Text(
                        "My Tickets",
                        style: whiteTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpiredTikets = !isExpiredTikets;
                                });
                              },
                              child: Text(
                                "Newest",
                                style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: !isExpiredTikets
                                      ? Colors.white
                                      : Color(0xFF6F678E),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: !isExpiredTikets
                                  ? acientColor2
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpiredTikets = !isExpiredTikets;
                                });
                              },
                              child: Text(
                                "Oldest",
                                style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: isExpiredTikets
                                      ? Colors.white
                                      : Color(0xFF6F678E),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 4,
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: isExpiredTikets
                                  ? acientColor2
                                  : Colors.transparent,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<Ticket> tickets;

  TicketViewer(this.tickets);

  @override
  Widget build(BuildContext context) {
    var sortedTicket = tickets;
    sortedTicket
        .sort((ticket1, ticket2) => ticket1.time.compareTo(ticket2.time));

    return ListView.builder(
      itemCount: sortedTicket.length,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () {
          context
              .bloc<PageBloc>()
              .add(GoToTicketDetailPage(sortedTicket[index]));
        },
        child: Container(
          margin: EdgeInsets.only(
              top: index == 0 ? 133 : 20,
              bottom: index == sortedTicket.length - 1 ? 90 : 0),
          child: Row(
            children: <Widget>[
              Container(
                height: 90,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imageBaseUrl +
                        'w500' +
                        sortedTicket[index].movieDetail.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width -
                    2 * defaultMargin -
                    70 -
                    16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      sortedTicket[index].movieDetail.title,
                      style: blackTextFont.copyWith(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      sortedTicket[index].movieDetail.genresAndLanguage,
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      sortedTicket[index].theater.name,
                      style: greyTextFont.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w400),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
