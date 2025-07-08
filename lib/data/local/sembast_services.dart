import 'dart:async';

import 'package:carezyadminapp/data/local/local_base_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class SembastServices extends LocalBaseServices {
  String dbPath = 'carezy_admin_app.db';
  late Database db;

  @override
  Future<void> deleteUserData() async {
    var store = intMapStoreFactory.store('user_details');
    await store.delete(db);
  }

  @override
  Future<void> getUserData() async {
    // var store = intMapStoreFactory.store('user_details');
    // var record = await store.find(db);
    return ;
  }

  @override
  Future<void> initialize() async {
    final appDir = await getTemporaryDirectory();
    db = await databaseFactoryIo.openDatabase('${appDir.path}/$dbPath');
  }

  @override
  Future<void> insertUserData(dynamic data) async {
    var store = intMapStoreFactory.store('user_details');
    store.add(db, data.toJson());
  }
}
