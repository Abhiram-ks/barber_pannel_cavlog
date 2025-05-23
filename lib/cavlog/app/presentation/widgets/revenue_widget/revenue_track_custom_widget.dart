import 'package:barber_pannel/core/routes/routes.dart';
import 'package:barber_pannel/core/themes/colors.dart';
import 'package:flutter/material.dart';

class RevanueContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const RevanueContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.revenueScreen);
      },
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppPalette.orengeClr,
              AppPalette.buttonClr
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.04),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        'Track and Analyze Revenue',
                        style: TextStyle(
                          color: AppPalette.whiteClr,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text(
                        'Here\'s an overview of your shop',
                        style: TextStyle(
                          color: Color.fromARGB(255, 227, 227, 227),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.025,
                    bottom: screenHeight * 0.025,
                    left: screenWidth * 0.045),
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(102),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.auto_graph_sharp,
                      color: AppPalette.whiteClr,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}