import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sqlite3/wasm.dart';

/// Obtains a database connection for running drift on the web.
DatabaseConnection connect(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
}) {
  return DatabaseConnection.delayed(
    Future(() async {
      if (inMemory) {
        final response = await http.get(Uri.parse('sqlite3.wasm'));
        final sqlite3 = await WasmSqlite3.load(
          response.bodyBytes,
        );

        return DatabaseConnection(
          WasmDatabase.inMemory(
            sqlite3,
            logStatements: logStatements,
          ),
        );
      }

      final db = await WasmDatabase.open(
        databaseName: 'todo-app',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.js'),
      );

      if (db.missingFeatures.isNotEmpty) {
        debugPrint('Using ${db.chosenImplementation} due to unsupported '
            'browser features: ${db.missingFeatures}');
      }

      return db.resolvedExecutor;
    }),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  // Unfortunately, validating database schemas only works for native platforms
  // right now.
  // As we also have migration tests (see the `Testing migrations` section in
  // the readme of this example), this is not a huge issue.
}
