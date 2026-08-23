import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:audio_book/presentation/screens/audio_book_detail_screen.dart';
import 'package:audio_book/presentation/screens/home_screen.dart';
import 'package:audio_book/presentation/screens/welcome_screen.dart';
import 'package:audio_book/providers/home_provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../presentation/screens/main_menu_page.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.home.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (_, state)=> WelcomeScreen()),
    StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: NamedRoutes.home.routeName, builder: (_, _)=> ChangeNotifierProvider(
              create: (_)=> HomeProvider(),
              builder: (_, _)=> HomeScreen()
            ))
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: NamedRoutes.search.routeName, builder: (_, _)=> Center(child: Text("Search"),))
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: NamedRoutes.bookmark.routeName, builder: (_, _)=> Center(child: Text("Profile Screen"),))
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: NamedRoutes.profile.routeName, builder: (_, _)=> Center(child: Text("Profile Screen"),))
          ]),

        ],
        builder: (ctx, state, navigationShell) => MainMenuPage(navigationShell: navigationShell)),
    GoRoute(path: NamedRoutes.audioBookDetail.routeName, builder: (_, state)=> AudioBookDetailScreen(audioBook: state.extra as AudioBookModel,)),

  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home'),
  search('/search'),
  bookmark('/bookmark'),
  profile('/profile'),
  audioBookDetail('/audio-book-detail')
  ;

  final String routeName;
  const NamedRoutes(this.routeName);
}