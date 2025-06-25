import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'film_magic.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Create all tables here
  Future<void> _onCreate(Database db, int version) async {
    // Users table (existing)
    await db.execute('''
      CREATE TABLE users(
        id TEXT PRIMARY KEY,
        email TEXT NOT NULL,
        name TEXT NOT NULL,
        image_url TEXT,
        theme_preference TEXT NOT NULL
      )
      ''');

    // Films table
    await db.execute('''
      CREATE TABLE films(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        original_title TEXT NOT NULL,
        overview TEXT NOT NULL,
        poster_path TEXT,
        backdrop_path TEXT,
        release_date TEXT NOT NULL,
        popularity REAL NOT NULL,
        vote_average REAL NOT NULL,
        vote_count INTEGER NOT NULL,
        adult INTEGER NOT NULL,
        video INTEGER NOT NULL,
        original_language TEXT NOT NULL,
        genre_ids TEXT NOT NULL
      )
    ''');

    // Film lists metadata table
    await db.execute('''
      CREATE TABLE film_lists(
        category TEXT PRIMARY KEY,
        page INTEGER NOT NULL,
        total_pages INTEGER NOT NULL,
        total_results INTEGER NOT NULL,
        dates_minimum TEXT,
        dates_maximum TEXT,
        cached_at TEXT NOT NULL
      )
    ''');

    // Film categories relationship table
    await db.execute('''
      CREATE TABLE film_categories(
        film_id INTEGER,
        category TEXT,
        PRIMARY KEY (film_id, category),
        FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE CASCADE
      )
    ''');

    // Film details table
    await db.execute('''
      CREATE TABLE film_details(
        id INTEGER PRIMARY KEY,
        budget INTEGER NOT NULL,
        homepage TEXT NOT NULL,
        imdb_id TEXT NOT NULL,
        revenue INTEGER NOT NULL,
        runtime INTEGER NOT NULL,
        status TEXT NOT NULL,
        tagline TEXT NOT NULL,
        belongs_to_collection_id INTEGER,
        cached_at TEXT NOT NULL,
        FOREIGN KEY (id) REFERENCES films (id) ON DELETE CASCADE
      )
    ''');

    // Genres table
    await db.execute('''
      CREATE TABLE genres(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL
      )
    ''');

    // Film genres relationship table
    await db.execute('''
      CREATE TABLE film_genres(
        film_id INTEGER,
        genre_id INTEGER,
        PRIMARY KEY (film_id, genre_id),
        FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE CASCADE,
        FOREIGN KEY (genre_id) REFERENCES genres (id) ON DELETE CASCADE
      )
    ''');

    // Collections table
    await db.execute('''
      CREATE TABLE collections(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        poster_path TEXT,
        backdrop_path TEXT
      )
    ''');

    // Cast table
    await db.execute('''
      CREATE TABLE film_cast(
        id INTEGER,
        film_id INTEGER,
        name TEXT NOT NULL,
        character TEXT NOT NULL,
        profile_path TEXT,
        order_num INTEGER NOT NULL,
        PRIMARY KEY (id, film_id),
        FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE CASCADE
      )
    ''');

    // Crew table
    await db.execute('''
      CREATE TABLE film_crew(
        id INTEGER,
        film_id INTEGER,
        name TEXT NOT NULL,
        department TEXT NOT NULL,
        job TEXT NOT NULL,
        profile_path TEXT,
        PRIMARY KEY (id, film_id, job),
        FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE CASCADE
      )
    ''');
  }

  // TODO: Add other tables here

  // Generic database operations that can be used by any repository
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> query(
    String table, {
    bool distinct = false,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final db = await database;
    return await db.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  Future<int> update(
    String table,
    Map<String, dynamic> data, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    final db = await database;
    return await db.update(table, data, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(
    String table, {
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }
}
