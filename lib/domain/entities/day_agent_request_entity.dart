import '../../data/model/day_agent_request_model.dart';

class DayAgentRequestEntity extends DayAgentRequestModel { 
  final int page;
  final String tab;

  DayAgentRequestEntity({required this.page,required this.tab,})
      : super(
        page: page,
        tab: tab,
        );
}

