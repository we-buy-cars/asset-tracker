import 'package:asset_tracker/apis/apis.dart';
import 'package:asset_tracker/dependencies.dart';
import 'package:asset_tracker/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserListPage extends StatefulWidget {

  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> with AutomaticKeepAliveClientMixin {

  final UserApi _userApi = di.get<UserApi>();

  List<User> _users = [];
  bool _loading = false;
  
  /// Tell the framework to keep this widget alive instead of re-building whenever it is not shown.
  /// Useful for the [PageView] controller we have in [HomePage].
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
        child: Builder(
          builder: (context) {
            // Indicate when something is busy loading.
            if (_loading) {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
              );
            }

            // Show a list of users.
            return ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                User user = _users[index];
                return Padding(
                  // Add padding to the last item so the last item's text isn't obscured by the floating action button when scrolled to bottom.
                  padding: index == _users.length - 1 ? const EdgeInsets.only(bottom: 50) : EdgeInsets.zero,
                  child: UserCard(
                    user: user,
                    onUserUpdated: (updatedUser) {
                      // You may want to make an API call first before updating the local state. The setState will update the data and cause the widget to re-render.
                      setState(() {
                        _users[index] = updatedUser;
                      });
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // The context.go function will attempt to find a route and navigate to it using the correct method.
        //
        // Available methods are:
        //  - push (adds a page to the stack that can be popped off)
        //  - replace (replaces the current route completely)
        //
        // If a route is embedded in another route, like /users/add is embedded in the / route, it will be pushed onto the stackby default.
        onPressed: () => context.go('/users/add'),
        child: const Icon(Icons.add),
      ),
    );
  }

  _loadUsers() async {
    setState(() => _loading = true);

    // You might want to wrap this in a try catch and show API errors.
    List<User> users = await _userApi.getUsers();

    // Tell the framework to redraw this widget using obtained data.
    setState(() {
      _users = users;
      _loading = false;
    });
  }
}
