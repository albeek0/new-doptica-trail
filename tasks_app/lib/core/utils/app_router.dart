import 'package:go_router/go_router.dart';
import 'package:tasks_app/features/edit_profile_f/edit_profile_view.dart';
import 'package:tasks_app/features/groubs_f/groubs_view.dart';
import 'package:tasks_app/features/home_f/home_view.dart';
import 'package:tasks_app/features/main_nav_f/navigation_f.dart';
import 'package:tasks_app/features/posts_f/posts_screen.dart';
import 'package:tasks_app/features/profile_f/profile_view.dart';
import 'package:tasks_app/features/sign_in_google_f/widgets/sign_in_page.dart';
import 'package:tasks_app/features/tasks_f/widgets/tasks_view.dart';
import 'package:tasks_app/features/teams_view_f/widgets/teams_view_f.dart';
import 'package:tasks_app/features/welcome_f/welcome.dart';

abstract class AppRouter {
  // static const ksplashview = '/';
  // static const keamilcheckview = '/eamilcheckview';
  // static const kcreatteamview = '/creatteamview';
  static const kteamsview = '/kteamsview';
  static const kHomeView = '/HomeView';
  static const kEditProfileView = '/EditProfileView';
  static const kProfileView = '/ProfileView';
  static const kTasksView = '/TasksView';
  static const kwelcome = '/welcome';
  static const ksignin = '/ksignin';
  static const knavitagationView = '/';
  // static const kSignIn = '/SignIn';
  static const kPostsScreen = '/PostsScreen';
  static const kgroubsview = '/groubsview';

  static final router = GoRouter(
    routes: [
      //  GoRoute(
      //   path: ksplashview,
      //   builder: (context, state) => const SplashView(),
      // ),
      //  GoRoute(
      //   path: keamilcheckview,
      //   builder: (context, state) => const EmailCheckView(),
      // ),
      // GoRoute(
      //   path: kcreatteamview,
      //   builder: (context, state) => const CreatTeamView(),
      // ),
      GoRoute(path: kteamsview, builder: (context, state) => const TeamsView()),
      GoRoute(
        path: kgroubsview,
        builder: (context, state) => const GroubsView(),
      ),
      GoRoute(
        path: knavitagationView,
        builder: (context, state) => const NavitagationView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(path: kTasksView, builder: (context, state) => const TasksView()),
      GoRoute(path: kwelcome, builder: (context, state) => const Welcome()),
      GoRoute(path: ksignin, builder: (context, state) => const SignInPage()),
      // GoRoute(
      //   path: kSignIn,
      //   builder: (context, state) => const SignIn(),
      // ),
      GoRoute(
        path: kPostsScreen,
        builder: (context, state) => const PostsScreen(),
      ),
    ],
  );
}
