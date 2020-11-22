import 'package:caribe_tour/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget emailField(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: kSecondaryColor),
      ),
      labelStyle: const TextStyle(color: kSecondaryColor),
      prefixIcon: const Icon(
        Icons.email,
        color: kSecondaryColor,
      ),
      labelText: tr("signin.email"),
    ),
    autocorrect: false,
    onChanged: (value) {
      return context
          .bloc<SignInFormBloc>()
          .add(SignInFormEvent.emailChanged(value));
    },
    validator: (_) {
      return context.bloc<SignInFormBloc>().state.emailAddress.value.fold(
            (l) => l.maybeMap(
              invalidEmail: (_) => tr('signin.invalid_email'),
              orElse: () => null,
            ),
            (r) => null,
          );
    },
  );
}

Widget passwordField(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: kSecondaryColor),
      ),
      labelStyle: const TextStyle(color: kSecondaryColor),
      prefixIcon: const Icon(
        Icons.lock,
        color: kSecondaryColor,
      ),
      labelText: tr('signin.password'),
    ),
    autocorrect: false,
    obscureText: true,
    onChanged: (value) {
      return context
          .bloc<SignInFormBloc>()
          .add(SignInFormEvent.passwordChanged(value));
    },
    validator: (_) {
      return context.bloc<SignInFormBloc>().state.password.value.fold(
            (l) => l.maybeMap(
              shortPassword: (_) => tr('signin.short_password'),
              orElse: () => null,
            ),
            (r) => null,
          );
    },
  );
}
