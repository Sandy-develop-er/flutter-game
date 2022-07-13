import 'package:flutter/material.dart';

class AppColors {

  //App Colors
  static const header = Color(0xFF0f1c46);
  static const primary = Color(0xFF105F50);
  static const primaryDark = Color(0xFF2C1A53);
  static const bg = Color(0xFF031038);
  static const secondBg = Color(0xFF030D2C);
  static const secondaryBg = Color(0xFF33344E);

  //Text Colors
  static const textPrimary = Color(0xFF13161E);
  static const textSecondary = Color(0xFFA3ADC9);

  //Container Colors
  static const myContainerColor = Color(0xFF1F2845);
  static const containerBg = Color(0xFF1F2845);
  static const containerBorder = Color(0xFFC9DFDA);
  static const containerColor =Color(0xFF1F2845);
  static const buttonRedColor =Color(0xFFE71D1D);

  //Divider Colors
  static const divider = Color(0x3D6F7B9B);
  static const dividerSecondary = Color(0xFF1F2845);
  static const border = Color(0xFFA9BCB9);

  //Icon Colors
  static const iconColor =Color(0xFFE15923);

  //Common Colors
  static const transparent = Colors.transparent;
  static const error = Color(0xFFF4603F);
  static const red = Color(0xFFfa5c0c);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const green = Color(0xFF00bd9c);
  static const yellow = Color(0xFFffd900);
  static const orange=Color(0xFFFF8F3F);
  static const maroonColor =Color(0xFF603050);
  static const yellowColor =Color(0xFFDD9406);
  static const borderYellowColor =Color(0xFFD29639);
  static const textColor =Color(0xFF1A1817);
  static const shimmerBase = Color(0xFFE4F4F0);
  static const lightYellowColor = Color(0xFFF9E995);
  static const shimmerAnim = Colors.white70;
  static const grey = Color(0xFFA7AFC7);
  static const navyBlueContainerColor = Color(0xFF050C20);


  // Gradient Color
  static buttonGradient() {
    return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF65FFDE), Color(0xFF1690D1)]
        );
  }

  static bgGradientBoxDecoration() {
    return  const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [-1,0.6],
          colors: [Color(0xFF03103A),Color(0xFF040C27)]
      ),
    );
  }

  static buttonGradientLight() {
    return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE0FFF8), Color(0xFFD0E9F6)]);
  }

  static Widget gradientOverlay(double h, double w, double cornerRadius) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [-1, 0.9],
          colors: [
            Color(0x10030D2C),
            Color(0xFC030D2C)
          ],
        ),
      ),
    );
  }

  static bgContainerBoxDecoration() {
    return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFCE6E6),Color(0xFFFFF6F6)]
      );
  }

  static bgSecondaryContainerBoxDecoration() {
    return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFCFFEE),Color(0xFFFFFFFF)]
      );
  }

 /* static Widget gradientOverlay(double h, double w, double cornerRadius) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [-1, 0.2,0.7],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
    );
  }
*/
}

