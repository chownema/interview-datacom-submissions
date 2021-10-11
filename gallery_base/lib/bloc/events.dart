abstract class EventBase {}
class EventPullList extends EventBase {
  final num id;
  EventPullList({this.id = 0});
} // Network
class EventGetList extends EventBase {} // Local