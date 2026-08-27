import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF2D333B);
const kSecondaryColor = Color(0xFFADBAC7);
const kColorsurfaceCanvas = Color(0xFFF6F6FB);
const Color kColorBodyText = Colors.black;
const Color kColorDisplayText = Color(0xFF334151);
const Color kGreyShadeLight = Color.fromARGB(255, 210, 209, 209);
const Color kGreyShade = Color.fromARGB(255, 203, 203, 203);
const Color kGreyShade1 = Color.fromARGB(255, 176, 175, 175);
const Color kGreyShade2 = Color.fromARGB(255, 143, 142, 142);
const Color kGreyShade3 = Color.fromARGB(255, 88, 88, 88);
const Color kGreyShade4 = Color.fromARGB(255, 58, 58, 58);

const Color kBackgroundColor = Colors.white;

const kPrimaryFont = 'Montserrat';

ThemeData get kAppLightTheme {
  ThemeData base = ThemeData.light(
    useMaterial3: true,
  );
  return base.copyWith(
    splashColor: Colors.transparent,
    primaryColor: kPrimaryColor,
    colorScheme: buildColorScheme(base.colorScheme),
    disabledColor: kGreyShade2,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: buildAppBarTheme(),
    drawerTheme: const DrawerThemeData(elevation: 0),
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
    inputDecorationTheme: buildInputDecorationTheme(
      base.inputDecorationTheme,
      buildTextTheme(base.textTheme),
    ),
    elevatedButtonTheme: buildElevatedButtonTheme(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
      ),
    ),
    dialogTheme: buildDiaLogTheme(),
    listTileTheme: const ListTileThemeData(
      iconColor: kColorDisplayText,
      selectedColor: kPrimaryColor,
      textColor: kColorDisplayText,
    ),
    switchTheme: buildSwitchTheme(),
    dividerTheme: const DividerThemeData(color: kGreyShadeLight),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      textColor: kPrimaryColor,
      iconColor: kPrimaryColor,
    ),
    floatingActionButtonTheme: buildFloatingActionButtonTheme(),
    tabBarTheme: const TabBarThemeData(
      unselectedLabelColor: kColorDisplayText,
    ),
    tooltipTheme: buildToolTipTheme(),
    datePickerTheme: buildDatePickerTheme(),
    snackBarTheme: const SnackBarThemeData(backgroundColor: kPrimaryColor),
  );
}

ColorScheme buildColorScheme(ColorScheme colorScheme) {
  return colorScheme.copyWith(
    error: Colors.red,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    surface: Colors.white,
    onPrimary: Colors.white,
  );
}

TextTheme buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        displayLarge: base.displayLarge?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        displayMedium: base.displayMedium?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        displaySmall: base.displaySmall?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        headlineLarge: base.headlineLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: kPrimaryFont,
        ),
        headlineMedium: base.headlineMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: kPrimaryFont,
        ),
        headlineSmall: base.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: kPrimaryFont,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: kPrimaryFont,
        ),
        titleMedium: base.titleMedium?.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: kPrimaryFont,
        ),
        titleSmall: base.titleSmall?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        bodyLarge: base.bodyLarge?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        bodyMedium: base.bodyMedium?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        bodySmall: base.bodySmall?.copyWith(
          fontFamily: kPrimaryFont,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: kPrimaryFont,
        ),
        labelMedium: base.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: kPrimaryFont,
        ),
        labelSmall: base.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: kPrimaryFont,
        ),
      )
      .apply(
        bodyColor: kColorDisplayText,
        displayColor: kColorDisplayText,
        decorationColor: kColorDisplayText,
      );
}

buildAppBarTheme() {
  return const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
  );
}

InputDecorationTheme buildInputDecorationTheme(
  InputDecorationTheme base,
  TextTheme baseTextTheme,
) {
  const borderSide = BorderSide(
    color: kGreyShade2,
  );
  final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: kGreyShade2,
    ),
  );
  return base.copyWith(
    // contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    contentPadding:
        const EdgeInsets.only(left: 17, top: 17, bottom: 17, right: 17),
    border: inputBorder,
    hintStyle: const TextStyle(color: kGreyShade1),
    enabledBorder: inputBorder,
    disabledBorder: inputBorder.copyWith(
      borderSide: borderSide.copyWith(color: kGreyShade),
    ),
    errorBorder: inputBorder.copyWith(
      borderSide: borderSide.copyWith(
        color: Colors.red,
      ),
    ),
    errorMaxLines: 2,
    focusedBorder: inputBorder.copyWith(
      borderSide: borderSide.copyWith(
        color: kPrimaryColor,
      ),
    ),
    isDense: true,
    filled: true,
    fillColor: const Color(0xFFF3F3F3),
    labelStyle: baseTextTheme.bodyMedium?.copyWith(fontSize: 13),
  );
}

buildElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      foregroundColor: kColorDisplayText,
      minimumSize: const Size(double.infinity, 53),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: const BorderSide(),
    ),
  );
}

buildDiaLogTheme() {
  return const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
  );
}

buildSwitchTheme() {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return kPrimaryColor;
        }
        return Colors.grey;
      },
    ),
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (!states.contains(WidgetState.selected)) {
          return Colors.grey;
        }
        return kPrimaryColor;
      },
    ),
    trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (!states.contains(WidgetState.selected)) {
          return kGreyShadeLight;
        }
        return kSecondaryColor;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (!states.contains(WidgetState.selected)) {
          return kGreyShadeLight;
        }
        return kSecondaryColor;
      },
    ),
  );
}

buildFloatingActionButtonTheme() {
  return const FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    ),
  );
}

buildToolTipTheme() {
  return const TooltipThemeData(
    decoration: BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
  );
}

buildDatePickerTheme() {
  return const DatePickerThemeData(
    elevation: 0,
    headerBackgroundColor: kPrimaryColor,
    headerForegroundColor: Colors.white,
  );
}

final kDropDownInputDecoration = InputDecoration(
  suffixIcon: const Icon(Icons.arrow_drop_down),
  suffixIconConstraints: BoxConstraints.tight(
    const Size(48, 18),
  ),
);
