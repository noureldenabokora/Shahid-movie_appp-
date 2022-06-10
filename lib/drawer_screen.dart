import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Drawer(
            backgroundColor: const Color(0xff151A30),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildItemDrawer(
                  icon: Icons.shop_sharp,
                  title: cubit.moviresid[index]['name'],
                  color: Colors.white,
                  context: context,
                  tap: () {
                    cubit.getMovies(
                      page: index.toString(),
                    );
                    Navigator.of(context).pop();
                  }),
              separatorBuilder: (context, index) => const SizedBox(height: 2),
              itemCount: cubit.moviresid.length,
            ));
      },
    );
  }

  Widget buildItemDrawer({
    required IconData icon,
    required String title,
    required Color color,
    void Function()? tap,
    context,
  }) =>
      Card(
        elevation: 5,
        color: const Color(0xff151A30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: tap,
            leading: Icon(
              icon,
              color: color,
              size: 25,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 19,
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      );
}
