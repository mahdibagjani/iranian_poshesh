
import '../../domain/entities/day_agent_request_entity.dart';

abstract class DayAgentAPIEvent{}

class DayAgentEvent extends DayAgentAPIEvent{
final  DayAgentRequestEntity request;
      DayAgentEvent({required this.request});
}
