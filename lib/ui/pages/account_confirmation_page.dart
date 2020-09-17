part of 'pages.dart';

class AccountCorfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountCorfirmationPage(this.registrationData);

  @override
  _AccountCorfirmationPageState createState() =>
      _AccountCorfirmationPageState();
}

class _AccountCorfirmationPageState extends State<AccountCorfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(
                                  GoToPreferencePage(widget.registrationData));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: (widget.registrationData.picture == null)
                            ? AssetImage("assets/user_pic.png")
                            : FileImage(widget.registrationData.picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "${widget.registrationData.name}",
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF3E9D9D),
                          size: 45,
                        )
                      : SizedBox(
                          height: 45,
                          width: 250,
                          child: RaisedButton(
                            color: Color(0xFF3E9D9D),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "Create My Account",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            onPressed: () async {
                              setState(() {
                                isSigningUp = true;
                              });

                              imageFileToUpload =
                                  widget.registrationData.picture;

                              SignInSignUpResult result =
                                  await AuthServices.signUp(
                                      widget.registrationData.email,
                                      widget.registrationData.password,
                                      widget.registrationData.name,
                                      widget.registrationData.selectedGenres,
                                      widget.registrationData.language);
                              if (result.userProfile == null) {
                                setState(() {
                                  isSigningUp = false;
                                });
                                Flushbar(
                                  duration: Duration(seconds: 4),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: result.message,
                                )..show(context);
                              }
                            },
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
