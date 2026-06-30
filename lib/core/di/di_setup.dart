import 'package:get_it/get_it.dart';
import '../../domain/services/dough_calculator_service.dart';
import '../../presentation/dough/dough_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Service
  getIt.registerLazySingleton<DoughCalculatorService>(() => DoughCalculatorService());

  // ViewModel
  getIt.registerFactory<DoughViewModel>(() => DoughViewModel(getIt()));
}
