part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 50,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Color(0xFF5F5588), width: 1),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage("assets/user_pic.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              genre,
              style: blackTextFont.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
