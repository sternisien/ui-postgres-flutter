import 'package:postgres/postgres.dart';

class PostgresProvider {
  Connection? _connection;
  PostgresProvider._privateConstructor();

  static final PostgresProvider _instance =
      PostgresProvider._privateConstructor();

  factory PostgresProvider() => _instance;

  Future<Connection?> getConnection() async {
    _connection = await Connection.open(
      Endpoint(
        host: 'localhost',
        port: 5432,
        database: 'postgres',
        username: 'admin',
        password: 'admin',
      ),
      // The postgres server hosted locally doesn't have SSL by default. If you're
      // accessing a postgres server over the Internet, the server should support
      // SSL and you should swap out the mode with `SslMode.verifyFull`.
      settings: ConnectionSettings(sslMode: SslMode.disable),
    );

    return _connection;
  }
}
