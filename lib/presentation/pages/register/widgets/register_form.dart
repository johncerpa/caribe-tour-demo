import 'package:auto_route/auto_route.dart';
import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:caribe_tour/presentation/pages/register/widgets/department_widget.dart';
import 'package:caribe_tour/presentation/routes/router.gr.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'birthday_picker_widget.dart';
import 'fields_widgets.dart';
import 'gender_picker_widget.dart';
import 'profile_image_widget.dart';
import 'upload_image_button_widget.dart';

class RegisterForm extends StatelessWidget {
  final bool isGuide;
  const RegisterForm({Key key, this.isGuide});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormBloc, RegisterFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {}, // No action taken yet
          (either) => either.fold(
            (authFailure) {
              FlushbarHelper.createError(
                message: authFailure.map(
                    cancelledByUser: (_) => tr('signin.cancelled'),
                    serverError: (_) => tr('signin.server_error'),
                    emailAlreadyInUse: (_) => tr('signin.email_already_in_use'),
                    invalidEmailAndPasswordCombination: (_) =>
                        tr('signin.invalid_email_and_password_combination'),
                    invalidProfileImage: (_) =>
                        tr('register.upload_a_profile_image')),
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
                const ProfileImage(),
                const SizedBox(height: 10),
                Center(child: UploadImageButton()),
                const SizedBox(height: 30),
                const FirstNameField(),
                const SizedBox(height: 25),
                const LastNameField(),
                Visibility(child: SizedBox(height: 25), visible: isGuide),
                Visibility(child: PhoneField(), visible: isGuide),
                Visibility(child: SizedBox(height: 25), visible: isGuide),
                Visibility(
                  child: DepartmentWidget(),
                  visible: isGuide,
                ),
                const SizedBox(height: 25),
                const BirthdayPicker(),
                const SizedBox(height: 25),
                const GenderPicker(),
                const SizedBox(height: 25),
                const EmailField(),
                const SizedBox(height: 25),
                const PasswordField(),
                const SizedBox(height: 30),
                RegisterButton(
                  isGuide: isGuide,
                ),
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

class RegisterButton extends StatelessWidget {
  final bool isGuide;
  const RegisterButton({Key key, this.isGuide});
  @override
  Widget build(BuildContext context) {
    return ClassicButton(
      onPressedFn: () {
        bool guide = isGuide;
        SystemChannels.textInput.invokeMethod('TextInput.hide');

        context
            .bloc<RegisterFormBloc>()
            .add(RegisterFormEvent.registerUser(isGuide));
      },
      child: Text(
        tr('register.register_text').toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
