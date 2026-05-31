import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_18/homework_%D1%81ubit/counter_cubit.dart';
import 'package:flutter_homework/lesson_18/homework_bloc/counter_bloc.dart';
import 'package:flutter_homework/router/app_router.dart';
import 'package:flutter_homework/router/route_names.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()), 
        //  BlocProvider(create: (context) => UserProfileCubit(FakeUserRepository())..loadUserProfile(),
        //  child: const UserProfileHomeworkScreen()),      
      ],
      child: MaterialApp.router(routerConfig: appRouter),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.block),
              title: Text('lesson_11'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(
                RouteNames.lesson_11.name,
                queryParameters: {'id': 'test-id', 'name': 'test-name'},
                extra: {'sortBy': 'price', 'sortOrder': 'asc'},
              ),
            ),
          ),

          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.pages),
              title: Text('lesson_12'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(RouteNames.lesson_12.name),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.task),
              title: Text('lesson_13'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(RouteNames.lesson_13.name),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.stream),
              title: Text('lesson_18'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(RouteNames.lesson_18.name),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.local_attraction_sharp),
              title: Text('lesson_19'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(RouteNames.lesson_19.name),
            ),
          ),
           Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.animation),
              title: Text('lesson_21'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(RouteNames.lesson_21.name),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.error),
              title: Text('lesson_22'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => context.goNamed(RouteNames.lesson_22.name),
            ),
          ),
        ],
      ),
    );
  }
}
