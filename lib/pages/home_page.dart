import 'package:asset_tracker/pages/pages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _controller = PageController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This callback is guaranteed to execute once after this widget's tree has been rendered.
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          GreetingPage(),
          UserListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.waving_hand), label: 'Welcome'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
        ],
        onTap: (index) => _setActivePage(index),
      ),
    );
  }

  _setActivePage(int index) async {
    _controller.jumpToPage(index);
    setState(() => _index = index);
  }
}
