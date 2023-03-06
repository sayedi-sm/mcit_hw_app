import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<List<dynamic>> _drawerData = [
    ['Home', Icons.home],
    ['Services', Icons.home_repair_service],
    ['Contact Us', Icons.contact_support],
    ['About', Icons.info],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: NavigationDrawer(
        children: List.generate(
          _drawerData.length + 1,
          (index) => index == 0
              ? const DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.facebook,
                      size: 84,
                      color: Colors.blue,
                    ),
                  ),
                )
              : _DrawerItem(
                  text: _drawerData[index - 1][0],
                  icon: _drawerData[index - 1][1],
                  index: index - 1),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.cyan),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(color: Colors.deepPurpleAccent),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.tealAccent),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(color: Colors.teal),
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatefulWidget {
  const _DrawerItem(
      {required this.text, required this.icon, required this.index, Key? key})
      : super(key: key);
  final String text;
  final IconData icon;
  final int index;

  @override
  State<_DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<_DrawerItem> {
  bool isListShown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          leading: Icon(widget.icon),
          trailing: widget.index == 1 ? null : const SizedBox.shrink(),
          title: Text(widget.text),
          onExpansionChanged: (isExpanded) {
            if (widget.index == 1) {
              setState(() {
                isListShown = isExpanded;
              });
            }
          },
          children: isListShown
              ? [
                  const ListTile(title: Text('Web Development')),
                  const ListTile(title: Text('Database Design')),
                ]
              : [],
        ),
      ],
    );
  }
}
