import 'package:flutter/material.dart';

import '../../login/login_screen.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Home',
        style: Theme.of(context).textTheme.headline5,
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text('Settings'),
            )),
      ],
      elevation: 0,
    );
  }
}
