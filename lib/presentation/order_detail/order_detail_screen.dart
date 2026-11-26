import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_bloc.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_event.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_state.dart';
import 'package:skelter/presentation/order_detail/widgets/order_detail_action_buttons.dart';
import 'package:skelter/presentation/order_detail/widgets/order_detail_payment_method.dart';
import 'package:skelter/presentation/order_detail/widgets/order_detail_product_card.dart';
import 'package:skelter/presentation/order_detail/widgets/order_detail_shimmer.dart';
import 'package:skelter/presentation/order_detail/widgets/order_detail_shipping_address.dart';
import 'package:skelter/presentation/order_detail/widgets/order_detail_summary.dart';
import 'package:skelter/presentation/order_detail/widgets/order_details_app_bar.dart';
import 'package:skelter/presentation/order_detail/widgets/tracking_details.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';

@RoutePage()
class OrderDetailScreen extends StatelessWidget {
  final String productId;

  const OrderDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyOrderBloc>(
      create: (_) => MyOrderBloc(
        getProducts: sl(),
        getProductDetail: sl(),
        localizations: context.localization,
      )..add(GetOrderProductDetailEvent(productId: productId)),
      child: BlocListener<MyOrderBloc, MyOrderState>(
        listenWhen: (previous, current) {
          final invoiceGenerated =
              previous.generatedInvoicePdf == null &&
              current.generatedInvoicePdf != null &&
              current.generatedInvoiceName != null;

          final invoiceError =
              previous.invoiceGenerationError == null &&
              current.invoiceGenerationError != null;

          return invoiceGenerated || invoiceError;
        },
        listener: (context, state) {
          if (state is ProductDetailErrorState) {
            context.showSnackBar(state.errorMessage);
          }

          if (state.generatedInvoicePdf != null &&
              state.generatedInvoiceName != null) {
            context.router.push(
              InvoicePreviewRoute(
                pdfBytes: state.generatedInvoicePdf!,
                fileName: state.generatedInvoiceName!,
              ),
            );
            return;
          }

          if (state.invoiceGenerationError != null) {
            context.showSnackBar(
              state.invoiceGenerationError!,
              isDisplayingError: true,
            );

            context.read<MyOrderBloc>().add(
              const ClearInvoiceGenerationErrorEvent(),
            );
          }
        },
        child: const OrderDetailBody(),
      ),
    );
  }
}

class OrderDetailBody extends StatelessWidget {
  const OrderDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<MyOrderBloc, bool>(
      (bloc) => bloc.state.isProductDetailLoading,
    );

    final productDetail = context.select<MyOrderBloc, ProductDetail?>(
      (bloc) => bloc.state.selectedProductDetail,
    );

    if (isLoading) {
      return const Scaffold(
        body: SafeArea(child: Center(child: OrderDetailShimmer())),
      );
    }

    return Scaffold(
      appBar: const OrderDetailsAppBar(),
      body: productDetail == null
          ? Center(child: Text(context.localization.opps_something_went_wrong))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  const OrderDetailProductCard(),
                  const SizedBox(height: 24),
                  const OrderDetailPaymentMethod(),
                  const SizedBox(height: 24),
                  const TrackingDetails(),
                  const SizedBox(height: 24),
                  const OrderDetailShippingAddress(),
                  const SizedBox(height: 24),
                  const OrderDetailSummary(),
                  const SizedBox(height: 24),
                  const OrderDetailActionButtons(),
                  SizedBox(height: 16 + context.bottomPadding),
                ],
              ),
            ),
    );
  }
}
