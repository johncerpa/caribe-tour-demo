import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        labelText: tr('register.first_name'),
      ),
      autocorrect: false,
      onChanged: (value) {
        context
            .bloc<RegisterFormBloc>()
            .add(RegisterFormEvent.firstNameChanged(value));
      },
      validator: (_) {
        return context.bloc<RegisterFormBloc>().state.firstName.value.fold(
              (l) => l.maybeMap(
                invalidName: (_) => tr('register.invalid_first_name'),
                orElse: () => null,
              ),
              (r) => null,
            );
      },
    );
  }
}

class LastNameField extends StatelessWidget {
  const LastNameField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Icons.lock,
          color: kSecondaryColor,
        ),
        labelText: tr('register.last_name'),
      ),
      autocorrect: false,
      onChanged: (value) {
        context
            .bloc<RegisterFormBloc>()
            .add(RegisterFormEvent.lastNameChanged(value));
      },
      validator: (_) {
        return context.bloc<RegisterFormBloc>().state.lastName.value.fold(
              (l) => l.maybeMap(
                invalidName: (_) => tr('register.invalid_last_name'),
                orElse: () => null,
              ),
              (r) => null,
            );
      },
    );
  }
}

class PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Icons.phone,
          color: kSecondaryColor,
        ),
        labelText: tr('register.cellphone'),
      ),
      autocorrect: false,
      onChanged: (value) {
        return context
            .bloc<RegisterFormBloc>()
            .add(RegisterFormEvent.phoneChanged(value));
      },
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Icons.lock,
          color: kSecondaryColor,
        ),
        labelText: tr('register.password'),
      ),
      autocorrect: false,
      obscureText: true,
      onChanged: (value) {
        return context
            .bloc<RegisterFormBloc>()
            .add(RegisterFormEvent.passwordChanged(value));
      },
      validator: (_) {
        return context.bloc<RegisterFormBloc>().state.password.value.fold(
              (l) => l.maybeMap(
                shortPassword: (_) => tr('register.short_password'),
                orElse: () => null,
              ),
              (r) => null,
            );
      },
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Icons.email,
          color: kSecondaryColor,
        ),
        labelText: tr('register.email'),
      ),
      autocorrect: false,
      onChanged: (value) {
        return context
            .bloc<RegisterFormBloc>()
            .add(RegisterFormEvent.emailChanged(value));
      },
      validator: (_) {
        return context.bloc<RegisterFormBloc>().state.emailAddress.value.fold(
              (l) => l.maybeMap(
                invalidEmail: (_) => tr('register.invalid_email'),
                orElse: () => null,
              ),
              (r) => null,
            );
      },
    );
  }
}
