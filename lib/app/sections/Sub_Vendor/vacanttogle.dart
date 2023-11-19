
import 'package:absolute_stay_site/app/sections/Sub_Vendor/UnoccupiedListSub.dart';
import 'package:absolute_stay_site/app/sections/Sub_Vendor/occupiedListSub.dart';
import 'package:flutter/material.dart';


class VacantCustomSwitchSub extends StatefulWidget {
  const VacantCustomSwitchSub({Key? key}) : super(key: key);

  @override
  _VacantCustomSwitchSubState createState() => _VacantCustomSwitchSubState();
}

class _VacantCustomSwitchSubState extends State<VacantCustomSwitchSub>
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
      return const OccupiedListSub();
    } else {
      return const UnoccupiedListSub();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
