import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/utils/app_style.dart';
import 'package:tasks_app/core/widgets/custome_container.dart';
import 'package:tasks_app/features/teams_view_f/cubit/teams_view_cubit.dart';
import 'package:tasks_app/features/teams_view_f/cubit/teams_view_state.dart';
import 'package:tasks_app/features/teams_view_f/widgets/add_group_dialog.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomeContainer(
        widget: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
      context: context,
      builder: (_) => const CreateGroupDialog(),
    );
                },
                icon: const Icon(Icons.add, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_sharp, color: Colors.white),
              ),
            ],
            backgroundColor: Colors.transparent,
            title: Text('Your Groups', style: AppStyles.styleOpenSansBold20),
          ),
          backgroundColor: Colors.transparent,
          body: BlocConsumer<TeamsViewCubit, TeamsViewState>(
            listener: (context, state) {
              if (state is TeamsViewError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is TeamsViewLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TeamsViewLoaded) {
                final groups = state.teams;

                if (groups.isEmpty) {
                  return Center(
                    child: Text('No Groups Yet', style: AppStyles.styleOpenSansBold24),
                  );
                }

                return ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    return ListTile(
                      title: Text(group.name),
                      subtitle: Text('Members: ${group.memberCount}'),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No Groups Yet', style: AppStyles.styleOpenSansBold24),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
