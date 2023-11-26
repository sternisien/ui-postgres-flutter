import 'package:postgres/postgres.dart';
import 'package:uitraining/services/postgres_provider.dart';

class UserRepository {
  PostgresProvider? _postgresProvider;

  UserRepository._privateConstructor() {
    _postgresProvider = PostgresProvider();
  }

  factory UserRepository() => UserRepository._privateConstructor();

  Future<Result> getUsers() async {
    Connection? c = await _postgresProvider!.getConnection();
    if (c!.isOpen) {
      print("open");
    }

    final Result mesUsers = await c.execute(
      Sql.named('SELECT * FROM public.user as u'),
    );
    c.close();

    return mesUsers;
  }
}
