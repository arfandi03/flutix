part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: mainColor, width: 1),
            image: DecorationImage(
              image: AssetImage("assets/$genre.png"),
              // colorFilter: ColorFilter.mode(acientColor1, BlendMode.color),
              fit: BoxFit.cover,
            ),
            color: mainColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          genre,
          style: blackTextFont.copyWith(
            fontSize: 12,
            // color: acientColor1,
          ),
        ),
      ],
    );
  }
}
