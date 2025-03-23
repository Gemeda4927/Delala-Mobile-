abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HomeInitial && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

class HomeLoaded extends HomeState {
  final int currentCarouselIndex;
  final List<Map<String, dynamic>> promotionalItems;
  final List<Map<String, dynamic>> categories;
  final List<Map<String, dynamic>> carouselItems;

  const HomeLoaded({
    required this.currentCarouselIndex,
    required this.promotionalItems,
    required this.categories,
    required this.carouselItems,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeLoaded &&
          runtimeType == other.runtimeType &&
          currentCarouselIndex == other.currentCarouselIndex &&
          _areListsEqual(promotionalItems, other.promotionalItems) &&
          _areListsEqual(categories, other.categories) &&
          _areListsEqual(carouselItems, other.carouselItems);

  @override
  int get hashCode =>
      currentCarouselIndex.hashCode ^
      promotionalItems.hashCode ^
      categories.hashCode ^
      carouselItems.hashCode;

  bool _areListsEqual(List<Map<String, dynamic>> list1, List<Map<String, dynamic>> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i].length != list2[i].length) return false;
      for (var key in list1[i].keys) {
        if (!list2[i].containsKey(key) || list1[i][key] != list2[i][key]) return false;
      }
    }
    return true;
  }
}