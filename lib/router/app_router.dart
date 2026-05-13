import 'package:flutter_homework/lesson_11/homework_11_screen.dart';
import 'package:flutter_homework/lesson_12/homework_12_screen.dart';
import 'package:flutter_homework/lesson_13/homework_13_screen.dart';
import 'package:flutter_homework/lesson_18/homework_%D1%81ubit/homework_cubit_screen.dart';
import 'package:flutter_homework/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_homework/lesson_18/state_managment_base_screen.dart';
import 'package:flutter_homework/main.dart';
import 'package:flutter_homework/router/rout_paths.dart';
import 'package:flutter_homework/router/route_names.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: RoutPaths.lesson_11,
          name: RouteNames.lesson_11.name,
          builder: (context, state) {
            final id = state.uri.queryParameters['id']??'null';
            final name = state.uri.queryParameters['name']??'null';
            final extra = state.extra is Map<String, dynamic> ? state.extra : null;
            // ignore: avoid_print
            print(extra);
            // ignore: avoid_print
            print('id: $id , name: $name');
            return Homework11Screen(id,name);
          } 
        ),
        GoRoute(
          path: RoutPaths.lesson_12,
          name: RouteNames.lesson_12.name,
          builder: (context, state) => const Homework12Screen(),
        ),
        GoRoute(
          path: RoutPaths.lesson_13,
          name: RouteNames.lesson_13.name,
          builder: (context, state) => const WidgetConstrainsTrainingScreen(),
        ),
        GoRoute(
          path: RoutPaths.lesson_18,
          name: RouteNames.lesson_18.name,
          builder: (context, state) => const Homework18Screen(),
        ),
        GoRoute(
          path: RoutPaths.cubit,
          name: RouteNames.cubit.name,
          builder: (context, state) => const HomeworkCubitScreen(),
        ),
        GoRoute(
          path: RoutPaths.bloc,
          name: RouteNames.bloc.name,
          builder: (context, state) => const HomeworkBlocScreen(),
        ),
      ],
    ),
  ],
);
