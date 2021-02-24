class APIPath {
  static String user(String uid) => 'users/$uid';
  static String diet(String uid, String dietId) => 'users/$uid/diets/$dietId';
  static String diets(String uid) => 'users/$uid/diets';
  static String userProfile(String uid) => 'users/$uid/userProfile';
}
