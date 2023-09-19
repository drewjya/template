import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:template/template.dart';

class ColorHelper {
  static Color seedColor = Colors.greenAccent;

  static Color getSurface({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 6 : 98));
  }

  static Color getSurfaceDim({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 6 : 87));
  }

  static Color getSurfaceBright({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 24 : 98));
  }

  static Color getSurfaceContainerLowest({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 4 : 100));
  }

  static Color getSurfaceContainerLow({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 10 : 96));
  }

  static Color getSurfaceContainer({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 12 : 94));
  }

  static Color getSurfaceContainerHigh({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 17 : 92));
  }

  static Color getSurfaceContainerHighest({bool darkMode = false}) {
    CorePalette p = CorePalette.of(seedColor.value);
    return Color(p.neutral.get(darkMode ? 22 : 90));
  }
}
