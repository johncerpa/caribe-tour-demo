import 'package:caribe_tour/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';

Widget signInButton(BuildContext context) {
  return ClassicButton(
    onPressedFn: () {
      // Hide keyboard after pressing on sign in
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      context
          .bloc<SignInFormBloc>()
          .add(const SignInFormEvent.signInWithEmailAndPasswordPressed());
    },
    child: Text(
      tr('signin.signin_text').toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget signInWithGoogleButton(BuildContext context) {
  return ClassicButton(
    onPressedFn: () {
      context
          .bloc<SignInFormBloc>()
          .add(const SignInFormEvent.signInWithGooglePressed());
    },
    colors: const [kSecondaryColor, kSecondaryDarkerColor],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/google-icon.png',
          height: 40,
        ),
        Text(
          tr('signin.signin_with_google').toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget registerOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        tr("signin.dont_have_account"),
        style: const TextStyle(color: Colors.black),
      ),
      const SizedBox(width: 5),
      GestureDetector(
        onTap: () {
          ExtendedNavigator.of(context).pushRegisterPage();
        },
        child: Text(
          tr("signin.register_here"),
          style: const TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
