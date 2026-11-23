import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skelter/common/theme/text_style/app_text_styles.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_bloc.dart';
import 'package:skelter/presentation/biometric_auth/bloc/biometric_auth_event.dart';
import 'package:skelter/utils/theme/extension/theme_extension.dart';

class BiometricAuthToggleTile extends StatelessWidget {
  const BiometricAuthToggleTile({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isBiometricEnrolled = context.select<BiometricAuthBloc, bool>(
      (bloc) => bloc.state.isBiometricEnrolled,
    );

    final bool isBiometricSupported = context.select<BiometricAuthBloc, bool>(
      (bloc) => bloc.state.isBiometricSupported,
    );

    return Container(
      height: 57,
      decoration: BoxDecoration(
        color: context.currentTheme.bgSurfaceBase2,
        border: Border.all(color: context.currentTheme.strokeNeutralLight200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          TablerIcons.fingerprint,
          color: context.currentTheme.iconNeutralDefault,
          size: 24,
        ),
        title: Text(
          context.localization.enable_or_disable,
          style: AppTextStyles.p2Regular.copyWith(
            color: context.currentTheme.textNeutralPrimary,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.65,
          child: CupertinoSwitch(
            value: isBiometricEnrolled,
            onChanged: isBiometricSupported
                ? (value) {
                    context.read<BiometricAuthBloc>().add(
                      BiometricAuthToggleEvent(isBiometricEnabled: value),
                    );
                  }
                : null,
            activeTrackColor: context.currentTheme.bgBrandDefault,
          ),
        ),
      ),
    );
  }
}
