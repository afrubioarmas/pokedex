class StringHelper {
  static String capitalize(String input) {
    return "${input[0].toUpperCase()}${input.substring(1)}";
  }
}
