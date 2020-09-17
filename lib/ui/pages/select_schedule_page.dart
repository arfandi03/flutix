part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectSchedulePage(this.movieDetail);

  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Theater selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates = List.generate(
      7,
      (index) => DateTime.now().add(
        Duration(days: index),
      ),
    );
    selectedDate = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToMovieDetailPage(widget.movieDetail));

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
                              context
                                  .bloc<PageBloc>()
                                  .add(GoToMovieDetailPage(widget.movieDetail));
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
                          "Choose Date\nand Theater",
                          style: blackTextFont.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 24),
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? defaultMargin : 0,
                          right:
                              (index < dates.length - 1) ? 16 : defaultMargin),
                      child: DateCard(
                        dates[index],
                        isSelected: selectedDate == dates[index],
                        onTap: () {
                          setState(() {
                            selectedDate = dates[index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
                generateTimeTable(),
                Container(
                  width: 250,
                  height: 46,
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) => RaisedButton(
                      child: Text(
                        "Continue",
                        style: isValid
                            ? whiteNumberFont.copyWith(fontSize: 16)
                            : greyTextFont.copyWith(fontSize: 16),
                      ),
                      color: isValid ? mainColor : Color(0xFFE4E4E4),
                      onPressed: () async {
                        if (isValid) {
                          context.bloc<PageBloc>().add(
                                GoToSelectSeatPage(
                                  Ticket(
                                      widget.movieDetail,
                                      selectedTheater,
                                      DateTime(
                                          selectedDate.year,
                                          selectedDate.month,
                                          selectedDate.day,
                                          selectedTime),
                                      randomAlphaNumeric(12).toUpperCase(),
                                      null,
                                      (userState as UserLoaded)
                                          .userProfile
                                          .name,
                                      null),
                                ),
                              );
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
          child: Text(
            theater.name,
            style: blackTextFont.copyWith(fontSize: 13),
          ),
        ),
      );

      widgets.add(
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: schedule.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                  left: (index == 0) ? defaultMargin : 0,
                  right: (index == schedule.length - 1) ? 16 : defaultMargin),
              child: SelectableBox(
                "${schedule[index]}:00",
                height: 50,
                isSelected: selectedTheater == theater &&
                    selectedTime == schedule[index],
                isEnable: schedule[index] > DateTime.now().hour ||
                    selectedDate.day != DateTime.now().day,
                onTap: () {
                  setState(
                    () {
                      selectedTheater = theater;
                      selectedTime = schedule[index];
                      isValid = true;
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}