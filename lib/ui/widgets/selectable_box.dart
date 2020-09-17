part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected, isEnable;
  final double height, width;
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnable = true,
      this.height = 60,
      this.width = 144,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (onTap != null) onTap();
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: (!isEnable)
                ? Color(0xFFE4E4E4)
                : isSelected ? acientColor2 : Colors.transparent,
            border: Border.all(
              color: (!isEnable)
                  ? Color(0xFFE4E4E4)
                  : isSelected ? Colors.transparent : Color(0xFFE4E4E4),
            ),
          ),
          child: Center(
            child: Text(
              text ?? "None",
              style: (textStyle ?? blackTextFont)
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}
