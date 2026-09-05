import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pitik/src/features/package/data/models/package_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class PackagesLocalDatasource {
  Future<List<PackageModel>> readPackages(int offset, String? searchQuery);
}

class PackageLocalDatasourceImpl implements PackagesLocalDatasource {
  Database? _database;

  static const pageSize = 25;

  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<String> get _localPath async {
    const name = 'packages.db';
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
      CREATE TABLE packages(
        id TEXT PRIMARY KEY,
        title TEXT,
        branding TEXT,
        description TEXT,
        note TEXT,
        inclusion TEXT,
        price REAL,
        lastUpdated INTEGER,
        dateAdded INTEGER,
        isDeleted INTEGER,
        isAvailable INTEGER
      )
    ''');
  }

  @override
  Future<List<PackageModel>> readPackages(
    int offset,
    String? searchQuery,
  ) async {
    final database = await db;

    final where = <String>['(isDeleted IS NULL OR isDeleted = 0)'];
    final args = <dynamic>[];

    if (searchQuery != null && searchQuery.isNotEmpty) {
      where.add('LOWER(title) LIKE ?');
      args.add('%${searchQuery.toLowerCase()}%');
    }

    final result = await database.query(
      'packages',
      where: where.join(' AND '),
      whereArgs: args.isEmpty ? null : args,
      orderBy: 'title ASC',
      limit: pageSize,
      offset: offset,
    );

    return result.map((row) => PackageModel.fromMap(row)).toList();
  }
}
