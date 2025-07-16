import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/teams_view_f/cubit/teams_view_cubit.dart';

class CreateGroupDialog extends StatefulWidget {
  const CreateGroupDialog({super.key});

  @override
  State<CreateGroupDialog> createState() => _CreateGroupDialogState();
}

class _CreateGroupDialogState extends State<CreateGroupDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController avatarController = TextEditingController();
  bool isLoading = false;

  void _submit() async {
    final name = nameController.text.trim();
    final avatar = avatarController.text.trim();

    if (name.isEmpty || avatar.isEmpty) return;

    setState(() => isLoading = true);

    await context.read<TeamsViewCubit>().createGroup(name, avatar);

    setState(() => isLoading = false);

    if (context.mounted) Navigator.of(context).pop(); // close dialog
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Group'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Group Name'),
          ),
          TextField(
            controller: avatarController,
            decoration: const InputDecoration(labelText: 'Avatar URL'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isLoading ? null : _submit,
          child: isLoading
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Create'),
        ),
      ],
    );
  }
}
