import 'package:clarity_flutter/clarity_flutter.dart';
import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/constants/integration_test_keys.dart';
import 'package:skelter/gen/assets.gen.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/presentation/login/bloc/login_events.dart';
import 'package:skelter/utils/extensions/primitive_types_extensions.dart';
import 'package:skelter/widgets/styling/app_colors.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late TextEditingController _phoneInputController;
  final FocusNode _focusNode = FocusNode();
  final PhoneNumber phoneNumberData = PhoneNumber(isoCode: 'IN');

  final Debouncer<String> _debouncer =
      Debouncer<String>(const Duration(milliseconds: 500), initialValue: '');

  @override
  void initState() {
    super.initState();
    _phoneInputController = TextEditingController();
    _focusNode.addListener(() {
      context
          .read<LoginBloc>()
          .add(PhoneInputHasFocus(hasFocus: _focusNode.hasFocus));
    });
  }

  @override
  void dispose() {
    _phoneInputController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  void _updatePhoneNumberEvent(PhoneNumber number) {
    context.read<LoginBloc>().add(
          CountryCodeChangeEvent(countryCode: number.dialCode ?? ''),
        );
    context.read<LoginBloc>().add(
          PhoneNumChangeEvent(phoneNumber: number.phoneNumber ?? ''),
        );
    final String? previousError = context
        .read<LoginBloc>()
        .state
        .phoneNumberLoginState
        ?.phoneNumErrorMessage;
    if (previousError.haveContent()) {
      context.read<LoginBloc>().add(PhoneNumErrorEvent(errorMessage: ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasFocus = context.select<LoginBloc, bool>(
      (bloc) => bloc.state.phoneNumberLoginState?.phoneInputHasFocus ?? false,
    );

    final String? phoneNumError = context.select<LoginBloc, String?>(
      (bloc) => bloc.state.phoneNumberLoginState?.phoneNumErrorMessage,
    );

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.mobile_number,
            style: AppTextStyles.p3Medium,
          ),
          const SizedBox(height: 8),
          ClarityMask(
            child: InternationalPhoneNumberInput(
              key: keys.signInPage.mobileNoTextField,
              textFieldController: _phoneInputController,
              focusNode: _focusNode,
              textStyle: AppTextStyles.p3Medium
                  .copyWith(color: AppColors.textNeutralPrimary),
              selectorTextStyle: const TextStyle(fontWeight: FontWeight.w500),
              initialValue: phoneNumberData,
              inputDecoration: InputDecoration(
                hintText: context.localization.enter_phone_number,
                hintStyle: AppTextStyles.p3Medium
                    .copyWith(color: AppColors.textNeutralDisable),
                errorStyle: AppTextStyles.p4Regular
                    .copyWith(color: AppColors.textErrorSecondary),
                border: buildOutlineInputBorder(hasFocus: hasFocus),
                enabledBorder: buildOutlineInputBorder(hasFocus: hasFocus),
                focusedBorder: buildOutlineInputBorder(hasFocus: hasFocus),
                errorBorder: buildOutlineInputBorder(isErrorBorder: true),
              ),
              searchBoxDecoration: _bottomSheatInputDecoration,
              validator: (_) {
                return phoneNumError;
              },
              onInputChanged: (PhoneNumber number) =>
                  _updatePhoneNumberEvent(number),
              ignoreBlank: true,
              hintText: null,
              selectorConfig: const SelectorConfig(
                leadingPadding: 12,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                trailingSpace: false,
                useEmoji: true,
                setSelectorButtonAsPrefixIcon: true,
                useBottomSheetSafeArea: true,
              ),
              autoValidateMode: AutovalidateMode.always,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({
    bool? hasFocus,
    bool? isErrorBorder,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: isErrorBorder ?? false
            ? AppColors.strokeErrorDefault
            : hasFocus ?? false
                ? AppColors.strokeBrandHover
                : AppColors.strokeNeutralLight200,
      ),
    );
  }

  InputDecoration get _bottomSheatInputDecoration {
    // Due to limitations of intl_phone_number, we can only add padding
    // to BottomSheetInput this way.
    final maxWidth = MediaQuery.sizeOf(context).width - 28;

    return InputDecoration(
      hintText: context.localization.search_by_name_or_code,
      hintStyle:
          AppTextStyles.p3Medium.copyWith(color: AppColors.textNeutralDisable),
      border: buildOutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: buildOutlineInputBorder(),
      focusedBorder: buildOutlineInputBorder(hasFocus: true),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SvgPicture.asset(
          Assets.icons.searchOutline,
          colorFilter: const ColorFilter.mode(
            AppColors.strokeNeutralDisabled,
            BlendMode.srcIn,
          ),
        ),
      ),
      constraints: BoxConstraints(maxWidth: maxWidth),
    );
  }
}
