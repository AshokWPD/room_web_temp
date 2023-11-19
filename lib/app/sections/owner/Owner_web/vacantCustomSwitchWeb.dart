
import 'package:flutter/material.dart';

import 'occupied_list_web.dart';
import 'unoccupied_listWeb.dart';

class VacantCustomSwitchMobile extends StatefulWidget {
  const VacantCustomSwitchMobile({Key? key}) : super(key: key);

  @override
  _VacantCustomSwitchMobileState createState() => _VacantCustomSwitchMobileState();
}

class _VacantCustomSwitchMobileState extends State<VacantCustomSwitchMobile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300.0,
          height: 100.0,
          child: Material(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey.shade200,
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: 'Occupied',
                      ),
                      Tab(
                        text: 'Unoccupied',
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                    ),
                    labelColor: customColor,
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(),
                    onTap: (index) {
                      setState(() {
                        _tabController.index = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        _ownerContent(), // Display the content based on the selected tab.
      ],
    );
  }

  Widget _ownerContent() {
    if (_tabController.index == 0) {
      return const OccupiedListMob();
    } else {
      return const UnoccupiedListMobile();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
