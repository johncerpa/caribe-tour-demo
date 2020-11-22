import 'dart:io';
import 'package:caribe_tour/application/auth/register_form/register_form_bloc.dart';
import 'package:caribe_tour/presentation/constants.dart';
import 'package:caribe_tour/presentation/shared_widgets/classic_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicButton(
      onPressedFn: () async {
        final picker = ImagePicker();
        final pickedImage = await picker.getImage(
          source: ImageSource.gallery,
          imageQuality: 30,
        );

        final imageSize = File(pickedImage.path).lengthSync();
        const sizeLimit = 15728640; // max: 15 megabytes

        if (pickedImage != null) {
          if (imageSize <= sizeLimit) {
            context
                .bloc<RegisterFormBloc>()
                .add(RegisterFormEvent.profilePictureChanged(
                  File(pickedImage.path),
                ));
          } else {
            FlushbarHelper.createError(message: 'Max size is 15 MBs')
                .show(context);
          }
        }
      },
      child: Text(
        tr('register.upload_image').toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
