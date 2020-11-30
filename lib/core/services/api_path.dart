class APIPath {
  static String diet(String uid, String dietId) => 'users/$uid/diets/$dietId';
  static String diets(String uid) => 'users/$uid/diets';
}
