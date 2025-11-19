import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tyrbine_website/models/stats.dart';
import 'package:tyrbine_website/service/tyrbine_api.dart';

final statsProvider = FutureProvider<Stats?>((ref) async {
  return await getStats();
});

Future<Stats?> getStats() async => await TyrbineApi.getStats();