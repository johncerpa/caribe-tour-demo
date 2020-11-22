import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';

import '../../../constants.dart';

class DepartmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      buildWhen: (previous, current) =>
          previous.department != current.department,
      builder: (context, state) {
        final dep = state.department;
        return TextField(
            onTap: () {
              showMaterialScrollPicker(
                context: context,
                title: tr('register.department'),
                items: [
                  "Atlántico",
                  "Bolívar",
                  "Cesar",
                  "Córdoba",
                  "La Guajira",
                  "Magdalena",
                  "Sucre",
                ],
                selectedItem: dep,
                onChanged: (value) {
                  final genre = value;
                  context
                      .bloc<RegisterFormBloc>()
                      .add(RegisterFormEvent.depChanged(genre));
                },
              );
            },
            readOnly: true,
            showCursor: false,
            decoration: InputDecoration(
              hintText: dep,
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
                Icons.map,
                color: kSecondaryColor,
              ),
              labelText: dep.isEmpty ? tr('register.department') : dep,
            ));
      },
    );
  }
}
