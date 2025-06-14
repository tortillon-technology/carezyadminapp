
abstract class LocalBaseServices {
  Future<void> initialize();

  Future<void> getUserData();

  Future<void> insertUserData(dynamic data);

  Future<void> deleteUserData();
}
