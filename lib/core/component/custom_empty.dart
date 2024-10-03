part of 'widgets.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(LottiePath.noData, width: 40.0.wp),
          Text(
            "${"informationIsNot".tr}\n${"available".tr}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 4.0.wp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0.wp,
          ),
        ],
      ),
    );
  }
}
