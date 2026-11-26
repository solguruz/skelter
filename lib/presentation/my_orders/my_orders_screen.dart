import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/home/domain/entities/product.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_bloc.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_event.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_state.dart';
import 'package:skelter/presentation/my_orders/widgets/my_order_app_bar.dart';
import 'package:skelter/presentation/my_orders/widgets/my_order_item.dart';
import 'package:skelter/presentation/my_orders/widgets/my_orders_shimmer.dart';

@RoutePage()
class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyOrderBloc(
        getProducts: sl(),
        getProductDetail: sl(),
        localizations: context.localization,
      )..add(const GetMyOrderProductsEvent()),
      child: const Scaffold(
        appBar: MyOrderAppBar(),
        body: MyOrdersScreenBody(),
      ),
    );
  }
}

class MyOrdersScreenBody extends StatelessWidget {
  const MyOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<MyOrderBloc, bool>(
      (bloc) => bloc.state is MyOrderLoadingState,
    );

    final products = context.select<MyOrderBloc, List<Product>>(
      (bloc) => bloc.state.products,
    );

    return isLoading
        ? const MyOrdersShimmer()
        : ListView.separated(
            itemCount: products.length,
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return MyOrderItem(product: products[index]);
            },
            separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          );
  }
}
