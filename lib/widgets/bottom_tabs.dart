import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BottomTabs extends StatefulWidget {
  final int? selectedTab;
  final Function(int) tabPressed;

  BottomTabs({this.selectedTab, required this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            icon: Icons.shopping_basket_outlined,
            selected: _selectedTab == 0 ? true : false,
            onPressed: () {
              widget.tabPressed(0);
            },
          ),
          BottomTabBtn(
            icon: Icons.storefront_outlined,
            selected: _selectedTab == 1 ? true : false,
            onPressed: () {
              widget.tabPressed(1);
            },
          ),
          BottomTabBtn(
            icon: LineAwesomeIcons.clipboard_list,
            selected: _selectedTab == 2 ? true : false,
            onPressed: () {
              widget.tabPressed(2);
            },
          ),
          BottomTabBtn(
            icon: Icons.account_circle_outlined,
            selected: _selectedTab == 3 ? true : false,
            onPressed: () {
              widget.tabPressed(3);
            },
          )
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  BottomTabBtn(
      {required this.icon, this.selected = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: _selected
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          width: 2.0,
        ))),
        child: Icon(
          icon,
          size: 32.0,
          color: _selected
              ? Theme.of(context).colorScheme.secondary
              : Colors.black,
        ),
      ),
    );
  }
}
