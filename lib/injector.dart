import 'package:delala/core/handlers/dio_client.dart';
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
  sl.registerSingleton<ApiService>(ApiService());

  // Todo feature
  sl.registerLazySingleton<TodoService>(() => TodoService());
  sl.registerLazySingleton<TodoRepo>(() => TodoRepoImpl(sl()));
  sl.registerLazySingleton<TodoUse>(() => TodoUse(sl()));
  sl.registerFactory<TodoBloc>(() => TodoBloc(sl()));

  // Auth feature
  // sl.registerLazySingleton<AuthService>(() => AuthService());
  // sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  // sl.registerLazySingleton<AuthUse>(() => AuthUse(sl()));
  // sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

  // Cart feature
  // sl.registerLazySingleton<CartService>(() => CartService());
  // sl.registerLazySingleton<CartRepo>(() => CartRepoImpl(sl()));
  // sl.registerLazySingleton<CartUse>(() => CartUse(sl()));
  // sl.registerFactory<CartBloc>(() => CartBloc(sl()));

  // Chat feature
  // sl.registerLazySingleton<ChatService>(() => ChatService());
  // sl.registerLazySingleton<ChatRepo>(() => ChatRepoImpl(sl()));
  // sl.registerLazySingleton<ChatUse>(() => ChatUse(sl()));
  // sl.registerFactory<ChatBloc>(() => ChatBloc(sl()));

  // Home feature
  // sl.registerLazySingleton<HomeService>(() => HomeService());
  // sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));
  // sl.registerLazySingleton<HomeUse>(() => HomeUse(sl()));
  // sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));

  // Notifications feature
  // sl.registerLazySingleton<NotificationService>(() => NotificationService());
  // sl.registerLazySingleton<NotificationRepo>(() => NotificationRepoImpl(sl()));
  // sl.registerLazySingleton<NotificationUse>(() => NotificationUse(sl()));
  // sl.registerFactory<NotificationBloc>(() => NotificationBloc(sl()));

  // Payment feature
  // sl.registerLazySingleton<PaymentService>(() => PaymentService());
  // sl.registerLazySingleton<PaymentRepo>(() => PaymentRepoImpl(sl()));
  // sl.registerLazySingleton<PaymentUse>(() => PaymentUse(sl()));
  // sl.registerFactory<PaymentBloc>(() => PaymentBloc(sl()));

  // Products feature
  sl.registerLazySingleton<ProductService>(() => ProductService());
  sl.registerLazySingleton<IProductRepository>(() => ProductRepository(sl()));
  // sl.registerLazySingleton<ProductUse>(() => ProductUse(sl()));
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl()));

  // Profile feature
  // sl.registerLazySingleton<ProfileService>(() => ProfileService());
  // sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()));
  // sl.registerLazySingleton<ProfileUse>(() => ProfileUse(sl()));
  // sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl()));

  // Wishlist feature
  // sl.registerLazySingleton<WishlistService>(() => WishlistService());
  // sl.registerLazySingleton<WishlistRepo>(() => WishlistRepoImpl(sl()));
  // sl.registerLazySingleton<WishlistUse>(() => WishlistUse(sl()));
  // sl.registerFactory<WishlistBloc>(() => WishlistBloc(sl()));
}
