import 'package:material_ui/material_ui.dart';
import 'package:skelter/core/services/app_tour_service.dart';
import 'package:skelter/presentation/home/widgets/home_app_bar.dart';
import 'package:skelter/presentation/home/widgets/product_search_bar.dart';
import 'package:skelter/presentation/home/widgets/products_headline_bar.dart';
import 'package:skelter/presentation/home/widgets/top_product_grid.dart';
import 'package:skelter/utils/app_environment.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, required this.bottomNavKey});

  final GlobalKey bottomNavKey;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final GlobalKey _searchBarKey = GlobalKey();
  final isFromTestEnvironment = AppEnvironment.isTestEnvironment;

  @override
  void initState() {
    super.initState();
    if (!isFromTestEnvironment) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _checkAndShowTour();
      });
    }
  }

  Future<void> _checkAndShowTour() async {
    try {
      final tourCompleted = await AppTourService.isTourCompleted();
      if (!tourCompleted && mounted) {
        await Future.delayed(const Duration(milliseconds: 300));

        if (mounted && _searchBarKey.currentContext != null) {
          AppTourService.showTour(
            context: context,
            searchBarKey: _searchBarKey,
            bottomNavKey: widget.bottomNavKey,
          );
        } else {
          debugPrint('Search bar key context is null, cannot show tour');
        }
      }
    } catch (e) {
      debugPrint('Error in _checkAndShowTour: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  ProductSearchBar(key: _searchBarKey),
                  const ProductsHeadlineBar(),
                  const TopProductGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
