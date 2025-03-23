import 'package:delala/core/handlers/dio_client.dart';
import 'package:delala/features/auth/sign_in/data/Service/auth_service.dart';
import 'package:delala/features/auth/sign_in/data/repositories/auth_repository_impl.dart'
    show AuthRepositoryImpl;
import 'package:delala/features/auth/sign_in/domain/repositories/auth_repository.dart';
import 'package:delala/features/auth/sign_in/domain/usecases/sign_in.dart';
import 'package:delala/features/auth/sign_in/presentation/bloc/login_bloc.dart';
// import 'package:delala/features/auth/sign_up/data/Service/auth_service.dart';
import 'package:delala/features/auth/sign_up/data/repository/auth_repo_impl.dart';
import 'package:delala/features/auth/sign_up/data/services/auth_service.dart'
    show AuthService;
import 'package:delala/features/auth/sign_up/domain/repository/auth_repo.dart';
import 'package:delala/features/auth/sign_up/domain/use_case/signup_use_case.dart';
import 'package:delala/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:delala/features/products/data/Repository/Repository_imple.dart';
import 'package:delala/features/products/data/services/product_service.dart';
import 'package:delala/features/products/domain/repository/repository.dart';
import 'package:delala/features/products/presentation/bloc/product_bloc_bloc.dart';
import 'package:delala/features/todo/data/repo/todo_repo_impl.dart';
import 'package:delala/features/todo/data/service/todo_service.dart';
import 'package:delala/features/todo/domain/repository/todo_repo.dart';
import 'package:delala/features/todo/domain/use_case/todo_use.dart';
import 'package:delala/features/todo/presentation/todo_bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjector() async {
  // Core services
  sl.registerSingleton<DioClient>(
    DioClient(baseUrl: 'http://192.168.1.2:3000'),
  );

  // Todo feature
  sl.registerLazySingleton<TodoService>(() => TodoService());
  sl.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(sl()));
  sl.registerLazySingleton<TodoUse>(() => TodoUse(sl()));
  sl.registerFactory<TodoBloc>(() => TodoBloc(sl()));

  // Auth feature
  sl.registerLazySingleton<AuthService>(() => AuthService(sl<DioClient>()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl()));

  // ✅ Sign In
  sl.registerLazySingleton<SignInService>(() => SignInService(sl<DioClient>()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<SignIn>(() => SignIn(sl()));
  sl.registerFactory<SignInBloc>(() => SignInBloc(sl()));

  // Products feature
  sl.registerLazySingleton<ProductService>(() => ProductService());
  sl.registerLazySingleton<IProductRepository>(() => ProductRepository(sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));
}
