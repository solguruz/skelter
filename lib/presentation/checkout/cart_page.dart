import 'package:flutter/material.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/checkout/data/cart_sample_data.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/bottom_items.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/cart_item_lists.dart';
import 'package:flutter_skeleton/presentation/checkout/widget/order_summary.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // below calculation should be moved in bloc
    final totalPrice = cartSampleData.fold(
      0.0,
      (total, item) => total + (item.product.price * item.quantities),
    );
    const discount = 25.9;
    const deliveryCharges = 10;
    final finalAmount =
        ((totalPrice - discount) + deliveryCharges).toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.cart_items,
          style: AppTextStyles.p2SemiBold,
        ),
        const SizedBox(height: 16),
        const CartItemLists(),
        const SizedBox(height: 16),
        OrderSummary(
          totalPrice: totalPrice,
          discount: discount,
          deliveryCharges: deliveryCharges,
          finalAmount: finalAmount,
        ),
        const SizedBox(height: 16),
        BottomItems(finalAmount: finalAmount),
      ],
    );
  }
}
