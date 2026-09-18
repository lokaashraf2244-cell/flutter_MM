class AuthDataSourceImpl implements AuthDataSource {

  final ApiConsumer apiConsumer;

  AuthDataSourceImpl(this.apiConsumer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return Right(response);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp({
    required String email,
    required String password,
  }) async {
    final response = await apiConsumer.post(
      '/signup',
      data: {
        'email': email,
        'password': password,
      },
    );

    return Right(response);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> verify({
    required String email,
    required String code,
  }) async {
    final response = await apiConsumer.post(
      '/verify',
      data: {
        'email': email,
        'code': code,
      },
    );

    return Right(response);
  }
}