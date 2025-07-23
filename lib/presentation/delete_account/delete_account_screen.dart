import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/constants/constants.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_bloc.dart';
import 'package:flutter_skeleton/presentation/delete_account/bloc/delete_account_state.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/delete_account_appbar.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/delete_account_button.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/delete_account_divider.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/delete_account_reasons_options.dart';
import 'package:flutter_skeleton/presentation/delete_account/widgets/delete_account_warnings.dart';
import 'package:flutter_skeleton/routes.gr.dart';
import 'package:flutter_skeleton/utils/extensions/build_context_ext.dart';

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
    } else if (state is DeleteAccountReAuthRequiredState) {
      context.showSnackBar(kFirebaseAuthRequiresRecentLogin);
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
