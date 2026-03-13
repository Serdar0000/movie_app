import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/core/themes/app_theme.dart';
import 'package:movie_app/core/di/injector.dart';
import 'package:movie_app/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:movie_app/features/favorite/presentation/screen/favorite_screen.dart';
import 'package:movie_app/features/home/presentation/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      home: const RootTabs(),
    );
  }
}

class RootTabs extends StatefulWidget {
  const RootTabs({super.key});

  @override
  State<RootTabs> createState() => _RootTabsState();
}

class _RootTabsState extends State<RootTabs> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    // Initialize favorites when app starts
    getIt<FavoriteBloc>().add(const InitializeFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(),
      BlocProvider<FavoriteBloc>.value(
        value: getIt<FavoriteBloc>(),
        child: const FavoriteScreen(),
      ),
    ];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            selectedIcon: Icon(Icons.movie),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
