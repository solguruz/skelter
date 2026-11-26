import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/presentation/home/bloc/home_bloc.dart';
import 'package:skelter/presentation/home/bloc/home_event.dart';
import 'package:skelter/presentation/home/bloc/home_state.dart';
import 'package:skelter/presentation/home/data/dummy_product_data.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/presentation/home/domain/usecases/get_products.dart';
import 'package:skelter/presentation/home/home_screen.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/get_product_detail.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/widgets/styling/app_theme_data.dart';

import '../../../integration_test/mock_firebase_performance.dart';
import '../../flutter_test_config.dart';
import '../../test_helpers.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockGetProducts extends Mock implements GetProducts {}

class MockGetProductDetail extends Mock implements GetProductDetail {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFirebasePerformance mockFirebasePerformance;

  setUpAll(() async {
    mockFirebasePerformance = MockFirebasePerformance();
    sl.allowReassignment = true;
    sl.registerLazySingleton<PerformanceMonitoringService>(
      () => PerformanceMonitoringService(performance: mockFirebasePerformance),
    );

    final mockGetProducts = MockGetProducts();
    final mockGetProductDetail = MockGetProductDetail();
    when(() => mockGetProducts())
        .thenAnswer((_) async => const Right(<Product>[]));
    sl.registerLazySingleton<GetProducts>(() => mockGetProducts);
    sl.registerLazySingleton<GetProductDetail>(() => mockGetProductDetail);

    setupFirebaseCoreMocks();
    await Firebase.initializeApp(
      name: 'tenantIdTest',
      options: const FirebaseOptions(
        apiKey: 'apiKey',
        appId: 'appId',
        messagingSenderId: 'messagingSenderId',
        projectId: 'projectId',
      ),
    );
  });

  // Widget tests
  group('Home Page', () {
    testWidgets('home page', (tester) async {
      //arrange
      final homeBloc = MockHomeBloc();
      when(() => homeBloc.state).thenReturn(HomeState.test());

      //act
      await tester.runWidgetTest(
        providers: [BlocProvider<HomeBloc>.value(value: homeBloc)],
        child: const HomeScreenWrapper(),
      );

      // assert
      expect(find.byType(HomeScreenWrapper), findsOneWidget);
    });

    // Golden test cases
    testExecutable(() {
      goldenTest(
        'Home page UI test',
        fileName: 'home_screen',
        pumpBeforeTest: precacheImages,
        builder: () {
          //arrange
          final homeBloc = MockHomeBloc();
          when(() => homeBloc.state).thenReturn(
            HomeState.test(
              topProducts: dummyProductData,
              filteredProducts: dummyProductData,
            ),
          );

          // act, assert
          return GoldenTestGroup(
            columnWidthBuilder: (_) =>
                const FixedColumnWidth(pixel5DeviceWidth),
            children: [
              createTestScenario(
                name: 'home_screen Light Theme',
                providers: [BlocProvider<HomeBloc>.value(value: homeBloc)],
                child: const HomeScreenWrapper(),
              ),
              createTestScenario(
                name: 'home_screen Dark Theme',
                providers: [BlocProvider<HomeBloc>.value(value: homeBloc)],
                child: const HomeScreenWrapper(),
                theme: AppThemeEnum.DarkTheme,
              ),
            ],
          );
        },
      );
    });
  });
}
