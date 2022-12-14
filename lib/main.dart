import 'package:easyt/data/data.dart';
import 'package:easyt/data/backends/memory.dart';
import 'package:easyt/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/provider.dart';

// TODO: prettify whole app

// TODO: multi_select_flutter for tags
// TODO: filters in collections
// TODO: filters in named types

// TODO: datatable: instead of long press, let user select multiple entries (even different types) and change add button to edit button

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    final Data _data = DataMemory();

    return MultiProvider(
      child: MaterialApp.router(
        title: "EasyT",
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
      providers: [
        ChangeNotifierProvider.value(value: TypeProvider(_data)),
        ChangeNotifierProvider.value(value: CollectionProvider(_data)),
        ChangeNotifierProvider.value(value: DataProvider(_data))
      ],
    );
  }
}
