part of 'widgets.dart';

class MoneyCard extends StatelessWidget {
  final double width;
  final bool isSelected;
  final int amount;
  final Function onTap;

  MoneyCard({this.width, this.isSelected, this.amount, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? Colors.transparent : Color(0xFFE4E4E4),
          ),
          color: isSelected ? acientColor2 : Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "IDR",
              style: greyTextFont.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              NumberFormat.currency(
                      locale: 'id_ID', symbol: '', decimalDigits: 0)
                  .format(amount),
              style: whiteNumberFont.copyWith(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
