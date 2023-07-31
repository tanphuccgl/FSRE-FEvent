import 'package:fevent/src/feature/my_event/logic/my_events_bloc.dart';
import 'package:fevent/src/feature/my_event/pages/all_tab.dart';
import 'package:fevent/src/feature/my_event/pages/doing_tab.dart';
import 'package:fevent/src/feature/my_event/pages/end_tab.dart';
import 'package:fevent/src/feature/my_event/pages/favourite_tab.dart';

import 'package:fevent/src/theme/colors.dart';
import 'package:fevent/src/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MyEventType {
  all,
  favourite,

  doing,
  end;

  String lableOf(BuildContext context) {
    switch (this) {
      case MyEventType.all:
        return "Tất cả";
      case MyEventType.favourite:
        return "Yêu thích";
      case MyEventType.doing:
        return "Sắp diễn ra";
      case MyEventType.end:
        return "Đã kết thúc";
    }
  }

  Widget get pageOf {
    switch (this) {
      case MyEventType.all:
        return const AllTab();
      case MyEventType.favourite:
        return const FavouriteTab();

      case MyEventType.doing:
        return const DoingTab();
      case MyEventType.end:
        return const EndTab();

      default:
        return const EmptyWidget();
    }
  }
}

class MyEventPage extends StatelessWidget {
  const MyEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final length = MyEventType.values.length;
    return BlocProvider(
      create: (context) => MyEventsBloc(),
      child: BlocBuilder<MyEventsBloc, MyEventsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text("Sự kiện của tôi",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: XColors.primary))),
            body: DefaultTabController(
              length: length,
              child: Column(
                children: [
                  TabBar(
                      labelColor: XColors.primary,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: XColors.primary,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                      tabs: MyEventType.values.map((e) {
                        return SizedBox(
                            width: width / length,
                            child: Tab(text: e.lableOf(context)));
                      }).toList()),
                  Expanded(
                    child: TabBarView(
                        children: MyEventType.values.map((e) {
                      return e.pageOf;
                    }).toList()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
