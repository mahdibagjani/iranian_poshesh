import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranian/core/consts/app_image.dart';
import 'package:iranian/core/failure.dart';
import 'package:iranian/domain/usecase/get_day_agent_usecase.dart';
import 'package:iranian/presentation/bloc/day_agent_bloc.dart';
import 'package:iranian/presentation/bloc/day_agent_state.dart';
import 'package:iranian/presentation/widget/bottom_navigation_item.dart';
import 'package:iranian/presentation/widget/custom_bottom_navigation_bar.dart';

import '../../injection.dart';
import '../bloc/day_agent_event.dart';
import '../widget/home_page_scaffold_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curentIndex = 1;
  late DayAgentBloc _agentBloc;
  @override
  void initState() {
    super.initState();
    _agentBloc = getIt<DayAgentBloc>();
    _agentBloc.add(DayAgentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff1C4870),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.menu),
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          title: Text(
            'پرونده های من',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => _agentBloc,)
          ], child: BlocBuilder<DayAgentBloc, DayAgentState>(
          builder: (context, state) {
            if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is Success) {
              print('length ${state.dayAgentResponseEntity.results.length}');
              return Column(children: [
                Expanded(
                  child: PageView(
                    children: [HomePageScaffoldWidget()],
                  ),
                ),
                CustomBottomNavigationBar()
              ]);
            } else {
              return Center(
                child: Text('Error'),
              );
            }
          },
        ),
        ));
  }
}
/*
Column(children: [
        Expanded(child: PageView(
          children: [HomePageScaffoldWidget()],
        ),),
        CustomBottomNavigationBar()
      ])
 Column(children: [
        Expanded(child: PageView(
          children: [HomePageScaffoldWidget()],
        ),),
        CustomBottomNavigationBar()
      ])
/ */