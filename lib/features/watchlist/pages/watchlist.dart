import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/services/cache_service.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';
import 'package:ridge_fin/core/widgets/button/ridge_button.dart';
import 'package:ridge_fin/core/widgets/status_image/status_image.dart';
import 'package:ridge_fin/features/watchlist/bloc/general_news_bloc.dart';
import 'package:ridge_fin/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';
import 'package:ridge_fin/features/watchlist/widgets/logout_bottom_sheet.dart';
import 'package:ridge_fin/features/watchlist/widgets/news_tile.dart';
import 'package:ridge_fin/features/watchlist/widgets/ticker_tile.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(const LoadWatchlist());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralNewsBloc(
        getIt<FinnhubRepository>(),
        getIt<CacheService>(),
      )..add(const LoadGeneralNews()),
      child: const _WatchlistPageView(),
    );
  }
}

class _WatchlistPageView extends StatelessWidget {
  const _WatchlistPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Padding(
          padding: EdgeInsets.only(left: AppDimensions.spacing24),
          child: Image.asset(
            AppImages.logo,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: AppDimensions.spacing16),
        actions: [
          IconButton.filled(
            onPressed: () {
              WatchlistLogoutBottomSheet.show(context);
            },
            style: IconButton.styleFrom(
              foregroundColor: AppColors.iconColor,
              backgroundColor: AppColors.iconButtonBackgroundColor,
            ),
            icon: const Icon(Icons.logout, size: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),

      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          context.read<WatchlistBloc>().add(const RefreshWatchlist());
          context.read<GeneralNewsBloc>().add(const RefreshGeneralNews());
        },
        child: SafeArea(
          child: Padding(
            padding: AppDimensions.getContentPadding(),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<WatchlistBloc, WatchlistState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (items, _) => items.isEmpty ? _buildEmptyState(context) : _buildContent(context),
                        loading: () => const Center(child: CircularProgressIndicator()),
                        error: (message) => Center(
                          child: Text(
                            message,
                            style: GoogleFonts.inter(color: AppColors.secondary),
                          ),
                        ),
                        orElse: () => const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppDimensions.spacing16),
                RidgeButton(
                  label: 'Add Stock',
                  onPressed: () {
                    context.router.push(const WatchlistSearchStockRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, watchlistState) {
        return watchlistState.maybeWhen(
          loaded: (items, quotes) {
            return ListView(
              children: [
                Text('Your Watchlist', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600)),
                SizedBox(height: AppDimensions.spacing4),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final quote = quotes[item.symbol];

                    return WatchlistTickerTile(
                      title: item.symbol,
                      description: item.title,
                      onTap: () {
                        context.router.push(
                          WatchlistStockQuoteRoute(
                            symbol: item.symbol,
                            title: item.title,
                          ),
                        );
                      },
                      trailing: quote != null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${quote.currentPrice.toStringAsFixed(2)}',
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "${quote.change >= 0 ? '+' : ''}${quote.change.toStringAsFixed(2)} (${quote.percentChange.toStringAsFixed(2)}%)",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: quote.change >= 0 ? AppColors.positive : AppColors.negative,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                    );
                  },
                ),
                SizedBox(height: AppDimensions.spacing24),
                Text(
                  'This Week News',
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppDimensions.spacing16),
                BlocBuilder<GeneralNewsBloc, GeneralNewsState>(
                  builder: (context, newsState) {
                    return newsState.maybeWhen(
                      loaded: (news) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: news.length > 5 ? 5 : news.length,
                          itemBuilder: (context, index) {
                            return WatchlistNewsTile(
                              article: news[index],
                              onTap: () => _launchUrl(news[index].url),
                            );
                          },
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (message) => Center(
                        child: Text(
                          'Failed to load news',
                          style: GoogleFonts.inter(color: AppColors.secondary),
                        ),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            );
          },
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.6),
      child: StatusImage(
        imagePath: AppImages.emptyState,
        title: 'Nothing under your watch!',
        description: "Track stocks you're interested in will show up here.",
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }
}
