part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: acientColor1,
        ),
        SafeArea(
            child: Container(
          color: Color(0xFFF6F7F9),
        )),
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              bottomNavBarIndex = index;
            });
          },
          children: <Widget>[
            MoviePage(),
            TicketPage(),
          ],
        ),
        createCustomBottomNavBar(),
      ],
    ));
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: bottomNavBarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                  title: Text(
                    "Home",
                    style: GoogleFonts.raleway(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Image.asset(
                      (bottomNavBarIndex == 0)
                          ? "assets/ic_home.png"
                          : "assets/ic_home_grey.png",
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Ticket",
                    style: GoogleFonts.raleway(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Image.asset(
                      (bottomNavBarIndex == 1)
                          ? "assets/ic_ticket.png"
                          : "assets/ic_ticket_grey.png",
                    ),
                  ),
                )
              ]),
        ),
      );
}
