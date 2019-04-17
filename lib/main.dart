import 'package:flutter/cupertino.dart';

import 'blocs/bloc_provider.dart';
import 'blocs/user_bloc.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'routes/routes.dart';

Future<void> main() async {
  Routes.configRoutes();

  return runApp(
    BlocProvider(
      child: MainApp(),
      blocs: [
        UserBloc(),
      ],
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  bool _isLogin;

  get _userBloc => BlocProvider.of<UserBloc>(context).first;

  @override
  void initState() {
    _isLogin = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _userBloc.isLogin.listen((isLogin) {
      setState(() {
        _isLogin = isLogin;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: _isLogin ? HomePage() : LoginPage(),
    );
  }
}
