part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Function()? function;
  final String? title;
  final Color? color, disabledColor, titleColor, borderColor;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final double? width;
  final bool? withBorder;
  final bool? onlyIcon;
  final Icon? icons;

  const CustomButton({
    super.key,
    @required this.function, //sudah
    this.title = "", //sudah
    this.color = Colors.transparent, //sudah
    this.disabledColor, //sudah
    this.titleColor, //sudah
    this.borderColor, //sudah
    this.height,
    this.fontSize,
    this.borderRadius = 12,
    this.width,
    this.withBorder = false,
    this.icons,
    this.onlyIcon = false, //sudah
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: function!,
      duration: const Duration(milliseconds: 100),
      child: Container(
        padding: EdgeInsets.all((withBorder == true) ? 1 : 0),
        height: height ?? 15.0.wp,
        width: (width != null) ? width : null,
        decoration: BoxDecoration(
          border: Border.all(color: (borderColor) != null ? borderColor! : color!, width: 2),
          borderRadius: BorderRadius.circular((borderRadius != null) ? borderRadius! : 12),
          color: color ?? AppColors.cyan,
        ),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              (borderRadius != null) ? borderRadius! : 12,
            ),
            color: color ?? AppColors.cyan,
          ),
          child: (onlyIcon != true)
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Center(
                    child: AutoSizeText(
                      title!,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyles.poppinsSemiBold.copyWith(
                        fontFamily: "poppins_semi_bold",
                        color: titleColor,
                        fontSize: (fontSize != null) ? fontSize : 4.5.wp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )
              : Center(child: icons),
        ),
      ),
    );
  }
}
