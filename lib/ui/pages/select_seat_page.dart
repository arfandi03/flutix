part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;

  const SelectSeatPage(this.ticket);

  @override
  _SelectSeatPageState createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context
            .bloc<PageBloc>()
            .add(GoToSelectSchedulePage(widget.ticket.movieDetail));

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
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: defaultMargin),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  context.bloc<PageBloc>().add(
                                      GoToSelectSchedulePage(
                                          widget.ticket.movieDetail));
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Choose Seats",
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 292,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/screen.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    generateSeats(),
                    Container(
                      width: 250,
                      height: 46,
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => RaisedButton(
                          child: Text(
                            "Continue",
                            style: selectedSeats.length > 0
                                ? whiteNumberFont.copyWith(fontSize: 16)
                                : greyTextFont.copyWith(fontSize: 16),
                          ),
                          color: selectedSeats.length > 0
                              ? mainColor
                              : Color(0xFFE4E4E4),
                          onPressed: () async {},
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column generateSeats() {
    List<int> numberOfSeats = [6, 6, 6, 6, 6, 6];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numberOfSeats[i],
            (index) => Padding(
              padding: EdgeInsets.only(
                  right: index < numberOfSeats[i] - 1 ? 16 : 0, bottom: 16),
              child: SelectableBox(
                "${String.fromCharCode(i + 65)}${index + 1}",
                width: 40,
                height: 40,
                textStyle: whiteNumberFont.copyWith(color: Colors.black),
                isSelected: selectedSeats
                    .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                onTap: () {
                  String seatNumber =
                      "${String.fromCharCode(i + 65)}${index + 1}";
                  setState(
                    () {
                      if (selectedSeats.contains(seatNumber)) {
                        selectedSeats.remove(seatNumber);
                      } else {
                        selectedSeats.add(seatNumber);
                      }
                    },
                  );
                },
                isEnable: index != 0,
              ),
            ),
          ),
        ),
      );
    }

    return Column(children: widgets);
  }
}
