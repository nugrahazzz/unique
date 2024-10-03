part of 'widgets.dart';

class CustomError extends StatelessWidget {
  final Color backgroundColor;
  final String errorMessage;
  final Function()? function;

  const CustomError({super.key, required this.errorMessage, this.function, this.backgroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  6.0.wp,
                ),
              )),
          margin: EdgeInsets.symmetric(horizontal: 5.0.wp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 6.0.wp),
                // padding: EdgeInsets.only(right: 6.0.wp, left: 6.0.wp, top: 4.0.wp, bottom: 4.0.wp),
                child:
                    Lottie.asset(LottiePath.caution, width: 70.0.wp, fit: BoxFit.cover, addRepaintBoundary: false, filterQuality: FilterQuality.low),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                child: Text(
                  errorMessage,
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white, fontSize: 4.2.wp, letterSpacing: 0.8),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0.wp),
                child: CustomButton(
                  title: "Reload now",
                  fontSize: 4.2.wp,
                  titleColor: AppColors.white,
                  color: AppColors.bgDark,
                  function: function,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
