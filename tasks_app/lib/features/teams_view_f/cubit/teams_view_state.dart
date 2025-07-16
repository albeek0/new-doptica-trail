import 'package:tasks_app/models/team.dart';

abstract class TeamsViewState {}

class TeamsViewInitial extends TeamsViewState {}

class TeamsViewLoading extends TeamsViewState {}

class TeamsViewLoaded extends TeamsViewState {
  final List<Team> teams;
  TeamsViewLoaded(this.teams);
}

class TeamsViewError extends TeamsViewState {
  final String message;
  TeamsViewError(this.message);
}
