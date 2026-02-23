import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/data/app_data.dart';
import '../../../core/models/service_category.dart';

// States
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ServiceCategory> categories;
  HomeLoaded(this.categories);
}

// Cubit
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void loadCategories() {
    emit(HomeLoaded(AppData.categories));
  }
}
