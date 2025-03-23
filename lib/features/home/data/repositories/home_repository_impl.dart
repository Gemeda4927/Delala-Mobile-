
import 'package:delala/features/home/data/service/home_local_data_source.dart';
import 'package:delala/features/home/domain/entities/home_data.dart';
import 'package:delala/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.localDataSource);

  @override
  Future<HomeData> getHomeData() async {
    return await localDataSource.getHomeData();
  }
}