import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';
import 'package:unisphere/features/auth/screens/login_screen.dart';
import 'package:unisphere/features/community/screens/edit_community_screen.dart';
import 'package:unisphere/features/home/screens/home_screen.dart';
import 'package:unisphere/features/community/screens/create_community_screen.dart';
import 'package:unisphere/features/community/screens/community_screen.dart';
import 'package:unisphere/features/community/screens/mod_tools_screen.dart';

final loggedOutRoute = RouteMap(
  routes: {'/': (_) => const MaterialPage(child: LoginScreen())},
);

final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/create-community':
        (_) => const MaterialPage(child: CreateCommunityScreen()),
    '/r/:name':
        (route) => MaterialPage(
          child: CommunityScreen(name: route.pathParameters['name']!),
        ),
    '/mod-tools/:name':
        (RouteData) => MaterialPage(
          child: ModToolsScreen(name: RouteData.pathParameters['name']!),
        ),
    '/edit-community/:name':
        (RouteData) => MaterialPage(
          child: EditCommunityScreen(name: RouteData.pathParameters['name']!),
        ),
  },
);
