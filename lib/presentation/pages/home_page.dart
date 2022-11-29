import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iranian/core/consts/app_color.dart';
import 'package:iranian/core/consts/app_strings.dart';
import 'package:iranian/domain/entities/day_agent_response_entity.dart';
import 'package:iranian/presentation/bloc/day_agent_bloc.dart';
import 'package:iranian/presentation/bloc/day_agent_state.dart';
import 'package:iranian/presentation/widget/custom_bottom_navigation_bar.dart';

import '../../domain/entities/day_agent_request_entity.dart';
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
  int _page = 0;
  List<Result> data = [];
  bool isLoading = true;
  late DayAgentResponseEntity _agentResponseEntity;
  DayAgentState _state = Loading();
  late DayAgentBloc _agentBloc;
  @override
  void initState() {
    super.initState();
    _agentBloc = getIt<DayAgentBloc>();
    _callDayAgentApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.menu),
            )
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24))),
          title: const Text(
            AppStrings.appbarName,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => _agentBloc,
            )
          ],
          child: BlocListener<DayAgentBloc, DayAgentState>(
            listener: (context, state) {
              setState(() {
                _state = state;
                if (state is Success) {
                  _fillDataForListView(state.dayAgentResponseEntity);
                }
              });
            },
            child: _body(context, _state),
          ),
        ));
  }

  void _callDayAgentApi() {
    _page++;
    _agentBloc.add(DayAgentEvent(
        request: DayAgentRequestEntity(page: _page, tab: 'issuance')));
  }

  _body(BuildContext context, DayAgentState state) {
    if (state is Success || data.isNotEmpty) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(children: [
            PageView(
                children: [
                  HomePageScaffoldWidget(
                    data: data,
                    atBotton: () {
                      if ((state as Success)
                              .dayAgentResponseEntity
                              .next
                              ?.isNotEmpty ??
                          false) {
                        _callDayAgentApi();
                      }
                    },
                  )
                ],
              ),
           Positioned(child:  const CustomBottomNavigationBar(),bottom: 0,)
          ]),
          if (state is Loading) const Center(child: CircularProgressIndicator())
        ],
      );
    } else if (state is Loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Center(
        child: Text('Error'),
      );
    }
  }

  void _fillDataForListView(DayAgentResponseEntity results) {
    _agentResponseEntity = results;
    results.results.map((e) => data.add(e)).toList();
  }
}
