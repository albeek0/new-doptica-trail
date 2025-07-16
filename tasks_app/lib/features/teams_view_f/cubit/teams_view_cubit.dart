import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/teams_view_f/cubit/teams_view_state.dart';
import 'package:tasks_app/models/new_group.dart';
import 'package:tasks_app/repos/teams_repos.dart';
import 'package:tasks_app/services/group_se.dart';

class TeamsViewCubit extends Cubit<TeamsViewState> {
  final TeamsRepository repository;

  TeamsViewCubit(this.repository) : super(TeamsViewInitial()) {
    loadTeams();
  }

  Future<void> loadTeams() async {
    emit(TeamsViewLoading());
    try {
      final teams = await repository.fetchTeams();
      emit(TeamsViewLoaded(teams));
    } catch (e) {
      print(e);
      emit(TeamsViewError('Failed to load teams: ${e.toString()}'));
    }
  }

  Future<void> createGroup(String name, String avatarUrl) async {
    emit(TeamsViewLoading());
    try {
      final newGroup = Group(name: name, avatarUrl: avatarUrl);
      final createdGroup = await GroupService.createGroup(newGroup);
      if (createdGroup != null) {
        // Option 1: Reload from backend
        await loadTeams();

        // Option 2 (alternative): Add to current state manually
        // if (state is TeamsViewLoaded) {
        //   final current = (state as TeamsViewLoaded).teams;
        //   emit(TeamsViewLoaded([...current, createdGroup]));
        // }
      } else {
        emit(TeamsViewError('Failed to create group'));
      }
    } catch (e) {
      emit(TeamsViewError('Error: ${e.toString()}'));
    }
  }
}
