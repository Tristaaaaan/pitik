import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pitik/src/features/addons/data/model/addon_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class AddOnsLocalDatasource {
  Future<void> createAddOn(AddOnModel addOn);
  Future<List<AddOnModel>> readAddOns(int offset, String? searchQuery);
  Future<void> updateAddOn(AddOnModel addOn);
  Future<void> deleteAddOn(String addOnId);
}

class AddOnLocalDatasourceImpl implements AddOnsLocalDatasource {
  Database? _database;

  static const pageSize = 25;

  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<String> get _localPath async {
    const name = 'addons.db';
    final dir = await getApplicationSupportDirectory();
    return p.join(dir.path, name);
  }

  Future<Database> _initializeDatabase() async {
    final path = await _localPath;

    await Directory(p.dirname(path)).create(recursive: true);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
      singleInstance: true,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE addons(
        id TEXT PRIMARY KEY,
        title TEXT,
        description TEXT,
        price REAL,
        unit TEXT,
        lastUpdated INTEGER,
        dateAdded INTEGER,
        isDeleted INTEGER,
        isAvailable INTEGER
      )
    ''');
  }

  @override
  Future<List<AddOnModel>> readAddOns(int offset, String? searchQuery) async {
    final database = await db;

    final where = <String>['(isDeleted IS NULL OR isDeleted = 0)'];
    final args = <dynamic>[];

    if (searchQuery != null && searchQuery.isNotEmpty) {
      where.add('LOWER(title) LIKE ?');
      args.add('%${searchQuery.toLowerCase()}%');
    }

    final result = await database.query(
      'addons',
      where: where.join(' AND '),
      whereArgs: args.isEmpty ? null : args,
      orderBy: 'dateAdded DESC',
      limit: pageSize,
      offset: offset,
    );

    return result.map((row) => AddOnModel.fromMap(row)).toList();
  }

  @override
  Future<void> createAddOn(AddOnModel addOn) async {
    final database = await db;
    await database.insert('addons', addOn.toMap());
  }

  @override
  Future<void> updateAddOn(AddOnModel addOn) async {
    final database = await db;
    await database.update(
      'addons',
      addOn.toMap(),
      where: 'id = ?',
      whereArgs: [addOn.id],
    );
  }

  @override
  Future<void> deleteAddOn(String addOnId) async {
    final database = await db;

    await database.update(
      'addons',
      {'isDeleted': 1},
      where: 'id = ?',
      whereArgs: [addOnId],
    );
  }
}
