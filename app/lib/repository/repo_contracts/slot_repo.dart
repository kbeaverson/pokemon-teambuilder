import 'package:app/model/user_defined_models/slot_model.dart';

abstract class SlotRepo {
  /// Get all slots for user
  Future<List<Slot>> getByUser(String userId); // TODO: Reconsider whether this is necessary
  /// Get slot by id
  Future<Slot?> getById(String slotId);
  /// Get all slots for team
  Future<List<Slot>> getByTeam(String teamId);
  /// Get all slots for bank
  Future<List<Slot>> getByBank(String bankEntryId);
  /// Create new slot for user(team)
  Future<void> createSlotForTeam(Slot slot, String teamId);
  /// Create new slot for user(bank)
  Future<void> createSlotForBank(Slot slot, String userId);
  /// Update slot
  Future<void> updateSlot(Slot slot);
  /// Delete slot
  Future<void> deleteSlot(String slotId);
  /// Delete all slots for team
  Future<void> deleteSlotsByTeam(String teamId);
}