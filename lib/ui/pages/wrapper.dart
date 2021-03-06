part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    if (user == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(user.uid));
        context.bloc<TicketBloc>().add(GetTickets(user.uid));

        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) => (pageState is OnSplashPage)
          ? SplashPage()
          : (pageState is OnLoginPage)
              ? SignInPage()
              : (pageState is OnRegistrationPage)
                  ? SignUpPage(pageState.registrationData)
                  : (pageState is OnPreferencePage)
                      ? PreferencePage(pageState.registrationData)
                      : (pageState is OnAccountConfirmationPage)
                          ? AccountCorfirmationPage(pageState.registrationData)
                          : (pageState is OnMovieDetailPage)
                              ? MovieDetailPage(pageState.movie)
                              : (pageState is OnSelectSchedulePage)
                                  ? SelectSchedulePage(pageState.movieDetail)
                                  : (pageState is OnSelectSeatPage)
                                      ? SelectSeatPage(pageState.ticket)
                                      : (pageState is OnCheckoutPage)
                                          ? CheckoutPage(pageState.ticket)
                                          : (pageState is OnSuccessPage)
                                              ? SuccessPage(pageState.ticket,
                                                  pageState.transaction)
                                              : (pageState is OnTicketDetailPage)
                                                  ? TicketDetailPage(
                                                      pageState.ticket)
                                                  : (pageState is OnProfilePage)
                                                      ? ProfilePage()
                                                      : (pageState is OnTopUpPage)
                                                          ? TopUpPage(pageState
                                                              .pageEvent)
                                                          : (pageState is OnWalletPage)
                                                              ? WalletPage(pageState
                                                                  .pageEvent)
                                                              : (pageState
                                                                      is OnEditProfilePage)
                                                                  ? EditProfilePage(
                                                                      pageState
                                                                          .userProfile)
                                                                  : MainPage(
                                                                      bottomNavBarIndex:
                                                                          (pageState as OnMainPage)
                                                                              .bottomNavBarIndex,
                                                                      isExpired:
                                                                          (pageState as OnMainPage).isExpired),
    );
  }
}
