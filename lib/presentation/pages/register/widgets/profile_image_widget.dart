import 'dart:io';
import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key}) : super(key: key);

  ImageProvider<dynamic> _setImage(Option<File> profileImageOption) {
    if (profileImageOption.isSome()) {
      return FileImage(profileImageOption.getOrElse(() => null));
    } else {
      return const AssetImage('assets/images/profile_placeholder.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterFormBloc, RegisterFormState>(
      builder: (context, state) {
        return Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: _setImage(state.profileImageOption),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(2, 3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
