import 'package:app/utils/enums/stat.dart';

/// Pokemon nature with both its increased stat and its decreased stat
enum Nature {
  hardy(increasedStat: Stat.atk, decreasedStat: Stat.atk),
  bold(increasedStat: Stat.def, decreasedStat: Stat.atk),
  modest(increasedStat: Stat.spa, decreasedStat: Stat.atk),
  calm(increasedStat: Stat.spd, decreasedStat: Stat.atk),
  timid(increasedStat: Stat.spe, decreasedStat: Stat.atk),
  lonely(increasedStat: Stat.atk, decreasedStat: Stat.def),
  docile(increasedStat: Stat.def, decreasedStat: Stat.def),
  mild(increasedStat: Stat.spa, decreasedStat: Stat.def),
  gentle(increasedStat: Stat.spd, decreasedStat: Stat.def),
  hasty(increasedStat: Stat.spe, decreasedStat: Stat.def),
  adamant(increasedStat: Stat.atk, decreasedStat: Stat.spa),
  impish(increasedStat: Stat.def, decreasedStat: Stat.spa),
  bashful(increasedStat: Stat.spa, decreasedStat: Stat.spa),
  careful(increasedStat: Stat.spd, decreasedStat: Stat.spa),
  jolly(increasedStat: Stat.spe, decreasedStat: Stat.spa),
  naughty(increasedStat: Stat.atk, decreasedStat: Stat.spd),
  lax(increasedStat: Stat.def, decreasedStat: Stat.spd),
  rash(increasedStat: Stat.spa, decreasedStat: Stat.spd),
  quirky(increasedStat: Stat.spd, decreasedStat: Stat.spd),
  naive(increasedStat: Stat.spe, decreasedStat: Stat.spd),
  brave(increasedStat: Stat.atk, decreasedStat: Stat.spe),
  relaxed(increasedStat: Stat.def, decreasedStat: Stat.spe),
  quiet(increasedStat: Stat.spa, decreasedStat: Stat.spe),
  sassy(increasedStat: Stat.spd, decreasedStat: Stat.spe),
  serious(increasedStat: Stat.spe, decreasedStat: Stat.spe),;

  const Nature ({
    required this.increasedStat,
    required this.decreasedStat,
  });

  final Stat increasedStat;
  final Stat decreasedStat;
}