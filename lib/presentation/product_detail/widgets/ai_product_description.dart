import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_bloc.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_event.dart';
import 'package:skelter/presentation/product_detail/bloc/product_detail_state.dart';
import 'package:skelter/presentation/product_detail/domain/entities/product_detail.dart';
import 'package:skelter/presentation/product_detail/widgets/ai_description_content.dart';
import 'package:skelter/presentation/product_detail/widgets/ai_description_error_widget.dart';
import 'package:skelter/presentation/product_detail/widgets/ai_description_generate_button.dart';
import 'package:skelter/presentation/product_detail/widgets/ai_description_header.dart';
import 'package:skelter/presentation/product_detail/widgets/ai_description_shimmer.dart';

class AIProductDescription extends StatelessWidget {
  final ProductDetail productDetail;
  final List<String>? userOrderHistory;

  const AIProductDescription({
    super.key,
    required this.productDetail,
    this.userOrderHistory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.isGeneratingAIDescription !=
              current.isGeneratingAIDescription ||
          previous.aiDescription != current.aiDescription ||
          previous.errorMessage != current.errorMessage,
      builder: (context, state) {
        final hasAIDescription = state.aiDescription != null;
        final isGenerating = state.isGeneratingAIDescription;
        final hasError = state is AIDescriptionError;

        return Column(
          crossAxisAlignment: .start,
          children: [
            AIDescriptionHeader(
              hasAIDescription: hasAIDescription,
              isGenerating: isGenerating,
              userOrderHistory: userOrderHistory,
            ),
            const SizedBox(height: 12),
            if (isGenerating)
              const AIDescriptionShimmer()
            else if (hasError)
              AIDescriptionErrorWidget(
                state: state,
                onTap: () => context.read<ProductDetailBloc>().add(
                  GenerateAIDescriptionEvent(
                    productDetail: productDetail,
                    userOrderHistory: userOrderHistory,
                  ),
                ),
              )
            else if (hasAIDescription)
              AIDescriptionContent(
                state: state,
                onTap: () => context.read<ProductDetailBloc>().add(
                  GenerateAIDescriptionEvent(
                    productDetail: productDetail,
                    userOrderHistory: userOrderHistory,
                  ),
                ),
              )
            else
              AIDescriptionGenerateButton(
                onTap: () => context.read<ProductDetailBloc>().add(
                  GenerateAIDescriptionEvent(
                    productDetail: productDetail,
                    userOrderHistory: userOrderHistory,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
