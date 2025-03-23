import 'package:delala/features/home/domain/entities/home_data.dart';
import 'package:delala/features/home/domain/repositories/home_repository.dart';

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<HomeData> call() async {
    return await repository.getHomeData();
  }
}