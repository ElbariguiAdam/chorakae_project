import 'package:chorakae_project/core/base/blocs/local/localization_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
final imagePicker = ImagePicker();
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  //Local Cubit
  sl.registerFactory(() => LocaleCubit(sl<SharedPreferences>()));
  //Features - Product

  // Bloc
  // sl.registerFactory(
  //   () => ProductBloc(sl()),
  // );
  // // Use cases
  // sl.registerLazySingleton(() => GetProductUseCase(sl()));
  // // Repository
  // sl.registerLazySingleton<ProductRepository>(
  //   () => ProductRepositoryImpl(
  //     remoteDataSource: sl(),
  //     localDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );
  // // Data sources
  // sl.registerLazySingleton<ProductRemoteDataSource>(
  //   () => ProductRemoteDataSourceImpl(client: sl()),
  // );
  // sl.registerLazySingleton<ProductLocalDataSource>(
  //   () => ProductLocalDataSourceImpl(sharedPreferences: sl()),
  // );
}
