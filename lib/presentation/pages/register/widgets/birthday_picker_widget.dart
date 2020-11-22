import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BirthdayPicker extends StatelessWidget {
  const BirthdayPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        var selectedDate = DateTime.now();

        if (state.birthday.isSome()) {
          selectedDate = state.birthday.getOrElse(() => null);
        }

        final formatter = DateFormat('yyyy-MM-dd');
        final formattedDate = formatter.format(selectedDate);

        return TextFormField(
          onTap: () async {
            final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: kPrimaryColor,
                    accentColor: kSecondaryColor,
                    colorScheme: const ColorScheme.light(
                      primary: kPrimaryColor,
                    ),
                    buttonTheme: const ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                    ),
                  ),
                  child: child,
                );
              },
            );

            if (pickedDate != null) {
              context
                  .bloc<RegisterFormBloc>()
                  .add(RegisterFormEvent.birthdayChanged(pickedDate));
            }
          },
          readOnly: true,
          showCursor: false,
          decoration: InputDecoration(
            hintText: state.birthday.isNone()
                ? tr('register.birthday')
                : formattedDate,
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
              Icons.calendar_today,
              color: kSecondaryColor,
            ),
            labelText: state.birthday.isNone()
                ? tr('register.birthday')
                : formattedDate,
          ),
          validator: (_) {
            return context
                .bloc<RegisterFormBloc>()
                .state
                .birthday
                .fold(() => tr('register.select_your_birthday'), (r) => null);
          },
        );
      },
    );
  }
}
