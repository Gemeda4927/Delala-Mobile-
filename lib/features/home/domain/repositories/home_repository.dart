import 'package:delala/features/home/domain/entities/home_data.dart';

abstract class HomeRepository {
  Future<HomeData> getHomeData();
}