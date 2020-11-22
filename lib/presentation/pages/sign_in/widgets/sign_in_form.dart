import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:caribe_tour/presentation/pages/sign_in/widgets/sign_register_buttons.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'fields_widgets.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {}, // No action taken yet
          (either) => either.fold(
            (authFailure) {
              FlushbarHelper.createError(
                message: authFailure.maybeMap(
                  cancelledByUser: (_) => tr('signin.cancelled'),
                  serverError: (_) => tr('signin.server_error'),
                  emailAlreadyInUse: (_) => tr('signin.email_already_in_use'),
                  invalidEmailAndPasswordCombination: (_) =>
                      tr('signin.invalid_email_and_password_combination'),
                  orElse: () => null,
                ),
              ).show(context);
            },
            (authSuccess) {
              ExtendedNavigator.of(context).replace(Routes.centralWidget);
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 50),
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: const AssetImage('assets/images/welcome.png'),
                  height: 225,
                ),
                const SizedBox(height: 55),
                emailField(context),
                const SizedBox(height: 25),
                passwordField(context),
                const SizedBox(height: 25),
                signInButton(context),
                const SizedBox(height: 30),
                signInWithGoogleButton(context),
                const SizedBox(height: 30),
                registerOption(context),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
