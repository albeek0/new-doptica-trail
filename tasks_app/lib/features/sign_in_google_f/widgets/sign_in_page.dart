import 'package:flutter/material.dart';
import 'package:tasks_app/core/utils/app_style.dart';
import 'package:tasks_app/features/sign_in_google_f/cubit/google_auth_service.dart';
import 'package:tasks_app/features/sign_in_google_f/widgets/terms_widget.dart';
import '../cubit/sign_in_cubit.dart';
import '../cubit/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/widgets/custome_container.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(authService: GoogleAuthService()),
      child: SafeArea(
        child: CustomeContainer(
          widget: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(backgroundColor: Colors.transparent),
            body: BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state.status == SignInStatus.failure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('❌ ${state.error}')));
                }
              },
              builder: (context, state) {
                if (state.status == SignInStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/Logo Doptica f3.png"),
                        SizedBox(height: 10),
                        if (state.status == SignInStatus.success) ...[
                          Text('✅ Welcome ${state.user?['name'] ?? 'User'}'),
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.60,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(fontSize: 26),
                                ),
                              ),
                            ),
                          ),InkWell(
                            hoverColor: Colors.white54,
                            onTap: () {
                              context.read<SignInCubit>().signOut();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'SignOut',
                                  style: AppStyles.styleOpenSansRegular24,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed:
                                () =>
                                    context
                                        .read<SignInCubit>()
                                        .fetchUserProfile(),
                            child: const Text('🔄 Refresh Profile'),
                          ),

                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed:
                                () => context.read<SignInCubit>().signOut(),
                            child: const Text('🚪 Sign Out'),
                          ),
                        ] else ...[
                          // const Text('🚫 Not signed in'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(
                                  Colors.transparent,
                                ),
                              ),
                              onPressed:
                                  () =>
                                      context
                                          .read<SignInCubit>()
                                          .signInWithGoogle(),
                              child: Image.asset("assets/images/gg.png"),
                            ),
                          ),
                          
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                          ),
                          TermsWidget(),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
