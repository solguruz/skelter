import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/common/theme/text_style/app_text_styles.dart';
import 'package:flutter_skeleton/gen/assets.gen.dart';
import 'package:flutter_skeleton/i18n/localization.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_bloc.dart';
import 'package:flutter_skeleton/presentation/login_signup/login/bloc/login_events.dart';
import 'package:flutter_skeleton/utils/extensions/string.dart';
import 'package:flutter_skeleton/widgets/styling/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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

  // final Debouncer _debouncer = Debouncer(
  //   delay: const Duration(milliseconds: 500),
  // );
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
            context.localization.login_signup_mobile_number,
            style: AppTextStyles.p3Medium,
          ),
          const SizedBox(height: 8),
          InternationalPhoneNumberInput(
            textFieldController: _phoneInputController,
            focusNode: _focusNode,
            textStyle: AppTextStyles.p3Medium
                .copyWith(color: AppColors.textNeutralPrimary),
            selectorTextStyle: const TextStyle(fontWeight: FontWeight.w500),
            initialValue: phoneNumberData,
            inputDecoration: InputDecoration(
              hintText: context.localization.login_signup_enter_phone_number,
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
      hintText: context.localization.login_signup_search_by_country,
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
