import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_router.dart';
import 'package:tasks_app/features/sign_in_google_f/cubit/google_auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/teams_view_f/cubit/teams_view_cubit.dart';
import 'package:tasks_app/repos/teams_repos.dart';

import 'features/sign_in_google_f/cubit/sign_in_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TeamsViewCubit(TeamsRepository())),
        BlocProvider(
          create: (context) => SignInCubit(authService: GoogleAuthService()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
