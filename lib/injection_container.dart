import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/network_info.dart';
import 'package:flutter_application_1/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_application_1/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/login.dart';
import 'package:flutter_application_1/features/auth/domain/usecases/signup.dart';
import 'package:flutter_application_1/features/auth/presentation/bloc/bloc/login_signup_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Dio>(() {
    Dio dio = Dio(BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    return dio;
  });
  sl.registerLazySingleton(() => InternetConnection());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteImpl(dio: sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));

  // Bloc
  sl.registerFactory(() => LoginSignupBloc(login: sl(), signup: sl()));
}
