import 'package:barber_pannel/core/themes/colors.dart';
import 'package:barber_pannel/core/utils/constant/constant.dart';
import 'package:barber_pannel/core/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Column ratingReviewListWidget({
    required BuildContext context,
    required String imageUrl,
    required String userName,
    required double rating,
    required String date,
    required String feedback,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: imageUrl.startsWith('http')
               ? NetworkImage(imageUrl)
               : AssetImage(AppImages.loginImageAbove) as ImageProvider,
            ),
            ConstantWidgets.width20(context),
            Expanded(child: Text(userName)),
          ],
        ),
        ConstantWidgets.hight10(context),
        Row(
          children: [
            RatingBarIndicator(
              rating: rating,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: AppPalette.buttonClr,
              ),
              itemCount: 5,
              itemSize: 18.0,
              direction: Axis.horizontal,
            ),
            ConstantWidgets.width20(context),
            Text(date)
          ],
        ),
        ConstantWidgets.hight20(context),
        Text(feedback)
      ],
    );
  }