import 'package:alrubaie/utility/app_info.dart';
import 'package:alrubaie/view/widgets/my_snack_bar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initalDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  initalDb() async {
    String databasePath = await getDatabasesPath(); // مكان قاعدة البيانات

    String path = join(databasePath,
        "$dbName.db"); // دمج اسم القاعدة مع الموقع للحصول على مسار كامل

    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);

    return mydb;
  }

  //  يتم استدعائها مره واحدة فقط وظيفتها انشاء الجداول لقاعدة البيانات
  _onCreate(Database db, int version) async {
    // await db.execute(
    //     'CREATE TABLE favorites (id INTEGER  NOT NULL  PRIMARY KEY AUTOINCREMENT, productID TEXT UNIQUE )');
    // print("create table");
    try {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS cart (id INTEGER  NOT NULL  PRIMARY KEY AUTOINCREMENT, productID TEXT UNIQUE , count INTEGER  )');
      // print("create table");

      await db.execute(
          'CREATE TABLE IF NOT EXISTS myOrder (id INTEGER  NOT NULL  PRIMARY KEY AUTOINCREMENT, orderID TEXT UNIQUE  )');
      // print("create table");
    } catch (ex) {
      mySnackBar(title: "حدثت مشكلة في انشاء قاعدة البيانات", body: "");
    }
  }

// يتم استدعائها في كل مره تغير فيها رقم version الغرض منها هو لتحديث قاعدة البيانات مثلا اضافة جدول جديد او حذف جدول
  _onUpgrade(Database db, int oldVersion, int newversion) async {
    if (oldVersion < 2) {
      // قم بإضافة الجدول الجديد فقط عند الترقية من إصدار قديم
      await db.execute(
          'CREATE TABLE IF NOT EXISTS myOrder (id INTEGER PRIMARY KEY AUTOINCREMENT, orderID TEXT UNIQUE)');
      // print("تمت ترقية قاعدة البيانات وإضافة جدول myOrder");
    }
    // print("onUpgrade");
  }

// Select
  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database mydb = await db;

    List<Map<String, dynamic>> response = await mydb.rawQuery(sql);

    return response;
  }

// insert
  Future<int> insertData(String sql) async {
    Database mydb = await db;

    int response = await mydb.rawInsert(sql);

    return response;
  }

// update
  updateData(String sql) async {
    Database mydb = await db;

    int response = await mydb.rawUpdate(sql);

    return response;
  }

// delete
  deleteData(String sql) async {
    Database mydb = await db;

    int response = await mydb.rawDelete(sql);

    return response;
  }
}
