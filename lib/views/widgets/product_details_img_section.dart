import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import '../../constants/color.dart';
import '../../models/product.dart';

Container productDetailsImageSection(
  Size size,
  Product product,
  currentImageIndex,
  setImageIndex,
) {
  return Container(
    height: size.height / 2,
    decoration: BoxDecoration(
      color: boxBg,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        PinchZoom(
          resetDuration: const Duration(milliseconds: 100),
          maxScale: 2.5,
          child: Hero(
            tag: product.id,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: otherImgsBg,
                  image: DecorationImage(
                      image: AssetImage(
                        product.otherImgs[currentImageIndex],
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: SizedBox(
            height: size.height / 2.2,
            width: 60,
            child: ListView.separated(
              itemCount: product.otherImgs.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setImageIndex(index),
                child: Container(
                  height: 60,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: otherImgsBg,
                      image: DecorationImage(
                          image: AssetImage(
                            product.otherImgs[index],
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
            ),
          ),
        )
      ],
    ),
  );
}
