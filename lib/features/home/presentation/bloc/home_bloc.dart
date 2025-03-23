import 'package:delala/features/home/domain/usecases/get_home_data.dart';
import 'package:delala/features/home/presentation/bloc/home_event.dart';
import 'package:delala/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc(this.getHomeData) : super(const HomeInitial()) {
    on<ChangeCarouselIndex>(_onChangeCarouselIndex);
    on<LoadHomeData>(_onLoadHomeData);
  }

  void _onChangeCarouselIndex(
    ChangeCarouselIndex event,
    Emitter<HomeState> emit,
  ) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(
        HomeLoaded(
          currentCarouselIndex: event.index,
          promotionalItems: currentState.promotionalItems,
          categories: currentState.categories,
          carouselItems: currentState.carouselItems,
        ),
      );
    }
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeInitial());
    try {
      final homeData = await getHomeData();
      emit(
        HomeLoaded(
          currentCarouselIndex: 0,
          promotionalItems: homeData.promotionalItems,
          categories: homeData.categories,
          carouselItems: homeData.carouselItems,
        ),
      );
    } catch (e) {
      // Handle error state if needed
      emit(const HomeInitial());
    }
  }
}