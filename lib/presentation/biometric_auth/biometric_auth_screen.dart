import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_bloc.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_event.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_state.dart';
import 'package:skelter/presentation/biometric_auth/widgets/biometric_auth_appbar.dart';
import 'package:skelter/presentation/biometric_auth/widgets/biometric_auth_description.dart';
import 'package:skelter/presentation/biometric_auth/widgets/biometric_auth_enrollment_bottom_sheet.dart';
import 'package:skelter/presentation/biometric_auth/widgets/biometric_auth_toggle_tile.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';

@RoutePage()
class BiometricAuthScreen extends StatelessWidget {
  const BiometricAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BiometricAuthBloc>(
      create: (_) =>
          BiometricAuthBloc(localizations: context.localization)
            ..add(const GetBiometricEnrolledStatusEvent()),
      child: BlocListener<BiometricAuthBloc, BiometricAuthState>(
        listener: (context, state) => _listenStateChanged(context, state),
        child: const BiometricAuthBody(),
      ),
    );
  }

  void _listenStateChanged(BuildContext context, BiometricAuthState state) {
    if (state is BiometricAuthSuccessState) {
      context.showSnackBar(context.localization.biometric_auth_enabled_success);
    } else if (state is BiometricAuthFailureState) {
      context.showSnackBar(
        state.errorMessage ?? context.localization.auth_failed,
      );
    } else if (state is IsBiometricAuthNotSupportedState) {
      context.showSnackBar(context.localization.biometric_auth_not_available);
    } else if (state is BiometricAuthNotEnrolledState) {
      showBiometricSetupEnrollmentBottomSheet(context);
    } else if (state is BioMetricsTooManyAttemptState) {
      context.showSnackBar(
        context.localization.biometric_auth_too_many_attempts,
      );
    }
  }
}

class BiometricAuthBody extends StatelessWidget {
  const BiometricAuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BiometricAuthAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              BiometricAuthToggleTile(),
              SizedBox(height: 20),
              BiometricAuthDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
