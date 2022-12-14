import 'package:auto_route/auto_route.dart';
import 'package:easyt/screens/collection/collection_screen.dart';
import 'package:easyt/screens/collection/collections_screen.dart';
import 'package:easyt/screens/collection/create_collection_screen.dart';
import 'package:easyt/screens/data/create_data_points_screen.dart';
import 'package:easyt/screens/named_type/create_named_type_screen.dart';
import 'package:easyt/screens/collection/edit_collections_screen.dart';
import 'package:easyt/screens/data/edit_data_group_screen.dart';
import 'package:easyt/screens/data/edit_data_point_screen.dart';
import 'package:easyt/screens/named_type/edit_named_types_screen.dart';
import 'package:easyt/screens/home_screen.dart';
import 'package:easyt/screens/named_type/named_types_screen.dart';
import 'package:easyt/screens/named_type/named_type_screen.dart';

// NOTE: run generate-routes.sh or watch-routes.sh after/before changing this file or cloning the repo!

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(path: '/', page: HomeScreen, children: [
    AutoRoute(
        path: 'collections',
        name: 'CollectionsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: CollectionsScreen),
          AutoRoute(path: 'create', page: CreateCollectionScreen),
          AutoRoute(path: 'edit', page: EditCollectionsScreen),
          AutoRoute(path: 'view', page: CollectionScreen),
          AutoRoute(path: 'addDataGroup', page: CreateDataPointsScreen),
          AutoRoute(path: 'editDataGroup', page: EditDataGroupScreen),
          AutoRoute(path: 'editDataPoint', page: EditDataPointScreen)
        ]),
    AutoRoute(
        path: 'named_types',
        name: 'NamedTypesRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: '', page: NamedTypesScreen),
          AutoRoute(path: 'create', page: CreateNamedTypeScreen),
          AutoRoute(path: 'edit', page: EditNamedTypesScreen),
          AutoRoute(path: 'view', page: NamedTypeScreen),
        ]),
  ]),
])
class $AppRouter {}
