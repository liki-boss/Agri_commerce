import 'package:agri_commerce/app_bloc_observer.dart';
import 'package:agri_commerce/bloc/baskets/baskets_bloc.dart';
import 'package:agri_commerce/bloc/communities/communities_bloc.dart';
import 'package:agri_commerce/bloc/products/products_bloc.dart';
import 'package:agri_commerce/bloc/users/users_bloc.dart';
import 'package:agri_commerce/screens/landing_page.dart';
import 'package:baskets_repository/baskets_repository.dart';
import 'package:communities_repository/communities_repository.dart';
import 'package:products_repository/products_repository.dart';
import 'package:users_repository/users_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) =>
              ProductsBloc(productsRepository: FirebaseProductsRepository())
                ..add(ProductsLoaded()),
        ),
        BlocProvider<UsersBloc>(
          create: (context) =>
              UsersBloc(firebaseUsersRepository: FirebaseUsersRepository())
                ..add(UsersLoaded()),
        ),
        BlocProvider(
          create: (context) => CommunitiesBloc(
              firebaseCommunitiesRepository: FirebaseCommunitiesRepository())
            ..add(CommunitiesLoaded()),
        ),
        BlocProvider(
          create: (context) => BasketsBloc(
              firebaseBasketsRepository: FirebaseBasketsRepository())
            ..add(BasketsLoaded()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Color(0xFFFF1E00)),
        ),
        home: LandingPage(),
      ),
    );
  }
}
