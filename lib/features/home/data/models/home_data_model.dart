import 'package:delala/features/home/domain/entities/home_data.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required List<Map<String, dynamic>> promotionalItems,
    required List<Map<String, dynamic>> categories,
    required List<Map<String, dynamic>> carouselItems,
  }) : super(
          promotionalItems: promotionalItems,
          categories: categories,
          carouselItems: carouselItems,
        );
}