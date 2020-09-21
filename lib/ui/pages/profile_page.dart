part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
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
                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) {
                        UserProfile userProfile =
                            (userState as UserLoaded).userProfile;

                        return Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "My Profile",
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // Container(
                            //     width: 150,
                            //     height: 150,
                            //     color: Colors.amberAccent),
                            Container(
                              height: 150,
                              width: 150,
                              // margin: EdgeInsets.only(bottom: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: (userProfile.picture == ""
                                      ? AssetImage("assets/user_pic.png")
                                      : NetworkImage(userProfile.picture)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                userProfile.name,
                                style: blackTextFont.copyWith(fontSize: 16),
                                textAlign: TextAlign.center,
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
                                    "Available\nBalance",
                                    style: blackTextFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            locale: "id_ID",
                                            decimalDigits: 0,
                                            symbol: "IDR ")
                                        .format(userProfile.balance),
                                    style: yellowNumberFont.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 250,
                              height: 46,
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: RaisedButton(
                                  elevation: 0,
                                  color: mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "Top Up My Wallet",
                                    style: whiteTextFont.copyWith(fontSize: 16),
                                  ),
                                  onPressed: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToTopUpPage(GoToProfilePage()));
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: defaultMargin),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 36,
                                    width: 36,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Edit Profile",
                                    style: blackTextFont.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: defaultMargin),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 36,
                                    width: 36,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Change Language",
                                    style: blackTextFont.copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AuthServices.singOut();
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: defaultMargin),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 36,
                                      width: 36,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Sign Out",
                                      style:
                                          blackTextFont.copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: defaultMargin),
                              child: Divider(
                                color: Color(0xFFE4E4E4),
                                thickness: 1,
                              ),
                            ),
                          ],
                        );
                      },
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
