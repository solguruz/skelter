import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/core/services/injection_container.dart';
import 'package:skelter/i18n/app_localizations.dart';
import 'package:skelter/presentation/checkout/model/invoice_model.dart';
import 'package:skelter/presentation/home/domain/usecases/get_products.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_event.dart';
import 'package:skelter/presentation/my_orders/bloc/my_order_state.dart';
import 'package:skelter/presentation/my_orders/services/pdf_service.dart';
import 'package:skelter/presentation/product_detail/domain/usecases/get_product_detail.dart';
import 'package:skelter/services/performance_monitoring_service.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/utils/permission_util.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  final AppLocalizations localizations;

  MyOrderBloc({
    required this._getProducts,
    required this._getProductDetail,
    required this.localizations,
  }) : super(const MyOrderState.initial()) {
    _setupEventListener();
  }

  final GetProducts _getProducts;
  final GetProductDetail _getProductDetail;
  final PerformanceMonitoringService _performanceService = sl();

  void _setupEventListener() {
    on<GetMyOrderProductsEvent>(_onGetMyOrderProductsEvent);
    on<GetOrderProductDetailEvent>(_onGetOrderProductDetailEvent);
    on<GenerateInvoiceEvent>(_onGenerateInvoiceEvent);
    on<ClearInvoiceGenerationErrorEvent>(_onClearInvoiceGenerationErrorEvent);
  }

  Future<void> _onGetMyOrderProductsEvent(
    GetMyOrderProductsEvent event,
    Emitter<MyOrderState> emit,
  ) async {
    _performanceService.startTrace(kTraceApiGetOrders);
    emit(MyOrderLoadingState(state));

    final result = await _getProducts();

    result.fold(
      (failure) {
        _performanceService.putAttribute(
          kTraceApiGetOrders,
          kTraceAttrError,
          failure.errorMessage.truncate(100),
        );
        emit(MyOrderErrorState(state, errorMessage: failure.errorMessage));
      },
      (products) {
        _performanceService.putAttribute(
          kTraceApiGetOrders,
          kTraceAttrSuccess,
          true,
        );
        emit(MyOrderLoadedState(state, products: products));
      },
    );

    _performanceService.stopTrace(kTraceApiGetOrders);
  }

  Future<void> _onGetOrderProductDetailEvent(
    GetOrderProductDetailEvent event,
    Emitter<MyOrderState> emit,
  ) async {
    emit(ProductDetailLoadingState(state));

    final result = await _getProductDetail(
      GetProductDetailParams(id: event.productId),
    );

    result.fold(
      (failure) => emit(
        ProductDetailErrorState(state, errorMessage: failure.errorMessage),
      ),
      (productDetail) =>
          emit(ProductDetailLoadedState(state, productDetail: productDetail)),
    );
  }

  Future<void> _onGenerateInvoiceEvent(
    GenerateInvoiceEvent event,
    Emitter<MyOrderState> emit,
  ) async {
    if (state.selectedProductDetail == null) {
      emit(
        state.copyWith(
          invoiceGenerationError: localizations.no_product_selected,
        ),
      );
      return;
    }

    final hasPermission = await PermissionUtil.hasStoragePermission();
    if (!hasPermission) {
      emit(
        state.copyWith(
          invoiceGenerationError: localizations.storage_permission_required,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isGeneratingInvoice: true,
        haveToClearPreviousInvoice: true,
      ),
    );
    try {
      final invoice = InvoiceModel.fromProductDetail(
        productDetail: state.selectedProductDetail!,
        localization: localizations,
      );

      final pdfBytes = await PdfService.generateInvoicePdf(
        invoice,
        localizations,
      );
      final fileName = '${invoice.invoiceNumber}.pdf';

      emit(
        state.copyWith(
          isGeneratingInvoice: false,
          generatedInvoicePdf: pdfBytes,
          generatedInvoiceName: fileName,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isGeneratingInvoice: false,
          invoiceGenerationError: e.toString(),
        ),
      );
    }
  }

  Future<void> _onClearInvoiceGenerationErrorEvent(
    ClearInvoiceGenerationErrorEvent event,
    Emitter<MyOrderState> emit,
  ) async {
    emit(state.copyWith(haveToClearInvoiceGenerationError: true));
  }
}
