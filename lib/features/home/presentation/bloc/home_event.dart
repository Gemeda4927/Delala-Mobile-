abstract class HomeEvent {
  const HomeEvent();
}

class ChangeCarouselIndex extends HomeEvent {
  final int index;

  const ChangeCarouselIndex(this.index);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangeCarouselIndex &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => index.hashCode;
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is LoadHomeData && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}