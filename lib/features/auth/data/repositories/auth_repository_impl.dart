import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exeptions.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/network/network_info.dart';
import 'package:flutter_application_1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_application_1/features/auth/data/models/user_model.dart';
import 'package:flutter_application_1/features/auth/domain/entities/user.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';

typedef SignUpOrLogin = Future<Unit> Function();

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> login(UserAuth user) async {
    final UserAuthModel userModel = UserAuthModel(user.firstName, user.lastName,
        user.email, user.phoneNumber, user.password, user.passwordconfirmation,
        id: user.id);

    return await _getMessage(() {
      return authRemoteDataSource.login(userModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> signup(UserAuth user) async {
    final UserAuthModel userModel = UserAuthModel(user.firstName, user.lastName,
        user.email, user.phoneNumber, user.password, user.passwordconfirmation,
        id: user.id);

    return await _getMessage(() {
      return authRemoteDataSource.signup(userModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(SignUpOrLogin loginOrSignup) async {
    if (await networkInfo.isConnected) {
      try {
        await loginOrSignup();
        return const Right(unit);
      } on ServerExeption {
        return const Left(ServerFailure());
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
