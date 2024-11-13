import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

final sl = GetIt.instance;
final imagePicker = ImagePicker();
Future<void> init() async {
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
