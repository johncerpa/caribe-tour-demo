import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        final selectedGender = state.gender.value.getOrElse(() => null);
        return TextFormField(
          onTap: () {
            showMaterialScrollPicker(
              context: context,
              title: tr('register.gender'),
              items: [tr('register.male'), tr('register.female')],
              selectedItem: selectedGender,
              onChanged: (value) {
                final genre = value == tr('register.male') ? 'Male' : 'Female';
                context
                    .bloc<RegisterFormBloc>()
                    .add(RegisterFormEvent.genderChanged(genre));
              },
            );
          },
          readOnly: true,
          showCursor: false,
          decoration: InputDecoration(
            hintText: selectedGender,
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
              Icons.person,
              color: kSecondaryColor,
            ),
            labelText: selectedGender ?? tr('register.gender'),
          ),
          validator: (_) {
            return context.bloc<RegisterFormBloc>().state.gender.value.fold(
                  (l) => l.maybeMap(
                    invalidGender: (_) => tr('register.select_your_gender'),
                    orElse: () => null,
                  ),
                  (r) => null,
                );
          },
        );
      },
    );
  }
}
