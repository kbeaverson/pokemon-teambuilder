import 'dart:convert';

import 'package:app/model/user_defined_models/slot_model.dart';
import 'package:app/repository/repo_contracts/slot_repo.dart';
import 'package:app/utils/powersync_util.dart';
import 'package:uuid/uuid.dart';

class SlotRepoPowersync extends SlotRepo {
  @override
  Future<void> createSlotForBank(Slot slot, String userId) async {
    // Insert slot into slots table
    await db.execute(
      'INSERT INTO slots (id, pokemon_id, ability_id, item_id, tera_type, is_gigantamax, notes, nature, move_ids, ivs, evs, team_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        slot.id,
        slot.pokemonId,
        slot.abilityPoolEntryId,
        slot.itemId,
        slot.teraType?.name,
        slot.isGigantamax ? 1 : 0,
        slot.notes,
        slot.nature.name,
        jsonEncode(slot.movePoolEntryIds),
        jsonEncode(slot.ivs),
        jsonEncode(slot.evs),
        null, // No teamId for bank slots
      ],
    );

    String bankEntryId = Uuid().v4(); // Generate bank entry id
    // Insert entry for slot into bank table
    await db.execute(
      'INSERT INTO bank (id, user_id, slot_id) VALUES (?, ?, ?)',
      [bankEntryId, userId, slot.id],
    );
  }

  @override
  Future<void> createSlotForTeam(Slot slot, String teamId) async {
    // Insert slot into slots table
    await db.execute(
      'INSERT INTO slots (id, pokemon_id, ability_id, item_id, tera_type, is_gigantamax, notes, nature, move_ids, ivs, evs, team_id, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        slot.id,
        slot.pokemonId,
        slot.abilityPoolEntryId,
        slot.itemId,
        slot.teraType?.name,
        slot.isGigantamax ? 1 : 0,
        slot.notes,
        slot.nature.name,
        jsonEncode(slot.movePoolEntryIds),
        jsonEncode(slot.ivs),
        jsonEncode(slot.evs),
        teamId,
      ],
    );
  }

  @override
  Future<void> deleteSlot(String slotId) async {
    // Delete slot from slots table
    await db.execute(
      'DELETE FROM slots WHERE id = ?',
      [slotId],
    );

    // Delete associated bank entry if exists
    await db.execute(
      'DELETE FROM bank WHERE slot_id = ?',
      [slotId],
    );
  }

  @override
  Future<List<Slot>> getByBank(String bankEntryId) async {
    // TODO: implement getByBank
    throw UnimplementedError();
  }

  @override
  Future<Slot?> getById(String slotId) async {
    final result = await db.get(
      'SELECT * FROM slots WHERE id = ?',
      [slotId],
    );
    if (result.isNotEmpty) {
      return Slot.fromRow(result);
    }
    return null;
  }

  @override
  Future<List<Slot>> getByTeam(String teamId) async {
    final results = await db.getAll(
      'SELECT * FROM slots WHERE team_id = ?',
      [teamId],
    );
    return results.map((e) => Slot.fromRow(e)).toList();
  }

  @override
  Future<List<Slot>> getByUser(String userId) async {
    // TODO: implement getByUser
    // FIXME: I don't think this method is necessary, as powersync only grabs the slots for the logged in user
    throw UnimplementedError();
  }

  @override
  Future<void> updateSlot(Slot slot) async {
    await db.execute(
      'UPDATE slots SET pokemon_id = ?, ability_id = ?, item_id = ?, tera_type = ?, is_gigantamax = ?, notes = ?, nature = ?, move_ids = ?, ivs = ?, evs = ?, team_id = ? WHERE id = ?',
      [
        slot.pokemonId,
        slot.abilityPoolEntryId,
        slot.itemId,
        slot.teraType?.name,
        slot.isGigantamax ? 1 : 0,
        slot.notes,
        slot.nature.name,
        jsonEncode(slot.movePoolEntryIds),
        jsonEncode(slot.ivs),
        jsonEncode(slot.evs),
        slot.teamId,
        slot.id,
      ],
    );
  }
  
  @override
  Future<void> deleteSlotsByTeam(String teamId) async {
    await db.execute(
      'DELETE FROM slots WHERE team_id = ?',
      [teamId],
    );
  }

}