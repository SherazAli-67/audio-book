import 'package:audio_book/presentation/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/main_menu_page.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.welcome.routeName,
  routes: [
    GoRoute(path: NamedRoutes.welcome.routeName, builder: (_, state)=> WelcomeScreen()),
    StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: NamedRoutes.home.routeName, builder: (_, _)=> Center(child: Text("Home"),))
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
  ],
);

enum NamedRoutes {
  welcome('/welcome'),
  home('/home'),
  search('/search'),
  bookmark('/bookmark'),
  profile('/profile')
  ;

  final String routeName;
  const NamedRoutes(this.routeName);
}