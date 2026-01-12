import 'package:injectable/injectable.dart';
import 'package:ridge_fin/features/watchlist/models/watchlist_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
class WatchlistRepository {
  final SupabaseClient _supabase;

  WatchlistRepository(this._supabase);

  Future<List<WatchlistItemModel>> getWatchlist() async {
    try {
      final response = await _supabase.from('watchlist').select().order('added_at', ascending: false);

      return (response as List).map((json) => WatchlistItemModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch watchlist: $e');
    }
  }

  Future<void> addToWatchlist(String symbol, String title) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      await _supabase.from('watchlist').insert({
        'user_id': userId,
        'symbol': symbol,
        'title': title,
      });
    } catch (e) {
      throw Exception('Failed to add to watchlist: $e');
    }
  }

  Future<void> removeFromWatchlist(String symbol) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) throw Exception('User not authenticated');

      await _supabase.from('watchlist').delete().eq('user_id', userId).eq('symbol', symbol);
    } catch (e) {
      throw Exception('Failed to remove from watchlist: $e');
    }
  }

  Future<bool> isInWatchlist(String symbol) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return false;

      final response = await _supabase.from('watchlist').select('id').eq('user_id', userId).eq('symbol', symbol).maybeSingle();

      return response != null;
    } catch (e) {
      return false;
    }
  }
}
