import 'package:app/model/static_models/ability_model.dart';
import 'package:app/repository/repo_contracts/ability_repo.dart';
import 'package:app/utils/powersync_util.dart';
import 'package:flutter/material.dart';

class AbilityRepoPowersync extends AbilityRepo {
  @override
  Future<List<Ability>> getAll() async {
    final results = await db.getAll(
      'SELECT * FROM abilities',
    );
    debugPrint('Fetched abilities: ${results.length}');
    return results.map((e) => Ability.fromRow(e)).toList();
  }

  @override
  Future<Ability?> getById(String id) async {
    final result = await db.get(
      'SELECT * FROM abilities WHERE id = ?',
      [id],
    );
    if (result.isEmpty) {return null;}
    return Ability.fromRow(result);
  }
  
}