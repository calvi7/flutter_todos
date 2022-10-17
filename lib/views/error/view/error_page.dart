import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../error.dart';
import 'error_view.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ErrorBloc(),
      child: const ErrorView(),
    );
  }
}
