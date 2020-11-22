import 'package:caribe_tour/application/auth/auth_bloc.dart';
import 'package:caribe_tour/domain/auth/local_domain_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/home_view.dart';

class HomePage extends StatelessWidget {
  final LocalDomainUser user;
  const HomePage({Key key, @required this.user});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => HomeView(user: user),
    );
  }
}
