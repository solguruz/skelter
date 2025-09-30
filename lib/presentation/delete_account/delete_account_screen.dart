import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skelter/constants/constants.dart';
import 'package:skelter/i18n/localization.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:skelter/presentation/delete_account/bloc/delete_account_state.dart';
import 'package:skelter/presentation/delete_account/constants/delete_account_constants.dart';
import 'package:skelter/presentation/delete_account/widgets/delete_account_appbar.dart';
import 'package:skelter/presentation/delete_account/widgets/delete_account_button.dart';
import 'package:skelter/presentation/delete_account/widgets/delete_account_divider.dart';
import 'package:skelter/presentation/delete_account/widgets/delete_account_reasons_options.dart';
import 'package:skelter/presentation/delete_account/widgets/delete_account_warnings.dart';
import 'package:skelter/presentation/login/bloc/login_bloc.dart';
import 'package:skelter/routes.gr.dart';
import 'package:skelter/utils/extensions/build_context_ext.dart';

@RoutePage()
class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteAccountBloc>(
      create: (_) => DeleteAccountBloc(),
      child: BlocListener<DeleteAccountBloc, DeleteAccountState>(
        listener: (context, state) => _listenStateChanged(context, state),
        child: const DeleteAccountBody(),
      ),
    );
  }

  void _listenStateChanged(BuildContext context, DeleteAccountState state) {
    if (state is DeleteAccountSuccessState) {
      context.router.replace(
        const AccountDeleteSuccessRoute(),
      );
    } else if (state is DeleteAccountFailureState) {
      context.showSnackBar(state.errorMessage ?? kSomethingWentWrong);
    } else if (state is DeleteAccountReAuthEmailPasswordRequiredState) {
      context.showSnackBar(kReAuthRequiredForPerformThisAction);
      context.router.replace(
        LoginWithEmailPasswordRoute(
          isFromDeleteAccount: true,
          loginBloc: LoginBloc(localizations: context.localization),
        ),
      );
    } else if (state is DeleteAccountReAuthPhoneRequiredState) {
      context.showSnackBar(kReAuthRequiredForPerformThisAction);
      context.router.pushAndPopUntil(
        LoginWithPhoneNumberRoute(isFromDeleteAccount: true),
        predicate: (_) => false,
      );
    } else if (state is DeleteAccountReAuthGoogleRequiredState) {
      context.showSnackBar(kReAuthRequiredForPerformThisAction);
    }
  }
}

class DeleteAccountBody extends StatelessWidget {
  const DeleteAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DeleteAccountAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DeleteAccountReasonOptions(),
                      DeleteAccountDivider(),
                      DeleteAccountWarnings(),
                    ],
                  ),
                ),
              ),
              DeleteAccountButton(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
