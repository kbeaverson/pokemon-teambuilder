import 'package:app/model/static_models/ability_model.dart';
import 'package:app/repository/ability_repo_powersync.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final AbilityRepoPowersync abilityRepo = AbilityRepoPowersync();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abilities'),
      ),
      body: FutureBuilder<List<Ability>>(
        future: abilityRepo.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No abilities found.'));
          }
      
          final abilities = snapshot.data!;
          return ListView.builder(
            itemCount: abilities.length,
            itemBuilder: (context, index) {
              final ability = abilities[index];
              debugPrint(ability.toJson().toString());
              return ListTile(
                title: Text(ability.name),
                subtitle: Text(ability.description),
              );
            },
          );
        },
      ),
    );
  }
}