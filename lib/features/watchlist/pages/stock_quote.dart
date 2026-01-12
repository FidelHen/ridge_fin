import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';
import 'package:ridge_fin/core/widgets/status_image/status_image.dart';
import 'package:ridge_fin/features/watchlist/bloc/stock_detail_bloc.dart';
import 'package:ridge_fin/features/watchlist/bloc/stock_chart_bloc.dart';
import 'package:ridge_fin/features/watchlist/bloc/watchlist_bloc.dart';
import 'package:ridge_fin/features/watchlist/models/company_news_model.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';
import 'package:ridge_fin/features/watchlist/repositories/finnhub_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/fmp_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/stock_data_repository.dart';
import 'package:ridge_fin/features/watchlist/repositories/watchlist_repository.dart';
import 'package:ridge_fin/features/watchlist/widgets/news_tile.dart';
import 'package:ridge_fin/features/watchlist/widgets/stock_chart.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class WatchlistStockQuotePage extends StatelessWidget {
  final String symbol;
  final String? title;

  const WatchlistStockQuotePage({
    super.key,
    @PathParam('symbol') required this.symbol,
    @QueryParam('title') this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockDetailBloc(
        getIt<FinnhubRepository>(),
        getIt<FmpRepository>(),
      )..add(LoadStockDetail(symbol)),
      child: _WatchlistStockQuoteView(
        symbol: symbol,
        title: title ?? symbol,
      ),
    );
  }
}

class _WatchlistStockQuoteView extends StatefulWidget {
  final String symbol;
  final String title;

  const _WatchlistStockQuoteView({
    required this.symbol,
    required this.title,
  });

  @override
  State<_WatchlistStockQuoteView> createState() => _WatchlistStockQuoteViewState();
}

class _WatchlistStockQuoteViewState extends State<_WatchlistStockQuoteView> {
  bool _isInWatchlist = false;
  bool _isCheckingWatchlist = true;

  @override
  void initState() {
    super.initState();
    _checkWatchlistStatus();
  }

  Future<void> _checkWatchlistStatus() async {
    final repository = getIt<WatchlistRepository>();
    final isInWatchlist = await repository.isInWatchlist(widget.symbol);
    if (mounted) {
      setState(() {
        _isInWatchlist = isInWatchlist;
        _isCheckingWatchlist = false;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    context.read<WatchlistBloc>().add(
      ToggleFavorite(widget.symbol, widget.title),
    );
    setState(() {
      _isInWatchlist = !_isInWatchlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockDetailBloc, StockDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.only(right: AppDimensions.spacing16),
            actions: [
              state.maybeWhen(
                loaded: (_, __, ___, ____) => _isCheckingWatchlist
                    ? const SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : IconButton(
                        onPressed: _toggleFavorite,
                        icon: Icon(
                          _isInWatchlist ? Icons.star : Icons.star_outline,
                          size: 28,
                          fontWeight: FontWeight.w500,
                          color: _isInWatchlist ? AppColors.gold : AppColors.iconColor,
                        ),
                      ),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
            title: state.maybeWhen(
              loaded: (_, __, ___, ____) => Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing20,
                  vertical: AppDimensions.spacing8,
                ),
                child: Text(
                  widget.symbol,
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              orElse: () => null,
            ),
          ),
          body: SafeArea(
            child: state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (symbol, quote, historicalPrices, news) {
                return _StockQuoteLoadedContent(
                  symbol: widget.symbol,
                  title: widget.title,
                  quote: quote,
                  historicalPrices: historicalPrices,
                  news: news,
                );
              },
              error: (message) => _buildEmptyState(message),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String message) {
    return Align(
      alignment: const Alignment(0, -0.6),
      child: StatusImage(
        imagePath: AppImages.errorState,
        title: 'Something went wrong',
        description: message,
      ),
    );
  }
}

class _StockQuoteLoadedContent extends StatefulWidget {
  final String symbol;
  final String title;
  final dynamic quote;
  final List<StockPriceModel> historicalPrices;
  final List<CompanyNewsModel> news;

  const _StockQuoteLoadedContent({
    required this.symbol,
    required this.title,
    required this.quote,
    required this.historicalPrices,
    required this.news,
  });

  @override
  State<_StockQuoteLoadedContent> createState() => _StockQuoteLoadedContentState();
}

class _StockQuoteLoadedContentState extends State<_StockQuoteLoadedContent> {
  int _activeTabIndex = 0;

  TimeRange _getTimeRangeFromIndex(int index) {
    switch (index) {
      case 0:
        return TimeRange.oneWeek;
      case 1:
        return TimeRange.oneMonth;
      case 2:
        return TimeRange.oneYear;
      default:
        return TimeRange.oneWeek;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = StockChartBloc(getIt<StockDataRepository>(), widget.historicalPrices);
        bloc.add(const LoadChartData(TimeRange.oneWeek));
        return bloc;
      },
      child: Builder(
        builder: (context) => _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: AppDimensions.getContentPadding(bottom: false),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: AppDimensions.spacing8),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: WatchlistStockChart(
            historicalPrices: widget.historicalPrices,
          ),
        ),
        SizedBox(height: AppDimensions.spacing16),
        _buildTabBar(context),
        SizedBox(height: AppDimensions.spacing32),
        Padding(
          padding: AppDimensions.getContentPadding(bottom: false, top: false),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Statistics',
                style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: AppDimensions.spacing16),
              _buildKeyStatistics(widget.quote),
            ],
          ),
        ),
        SizedBox(height: AppDimensions.spacing24),
        if (widget.news.isNotEmpty) ...[
          Padding(
            padding: AppDimensions.getContentPadding(bottom: false, top: false),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company News',
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: AppDimensions.spacing16),
                _buildCompanyNews(widget.news),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildKeyStatistics(dynamic quote) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.dividerColor),
      ),
      padding: EdgeInsets.all(AppDimensions.spacing14),
      child: Wrap(
        spacing: AppDimensions.spacing24,
        runSpacing: AppDimensions.spacing16,
        children: [
          _buildStatItem('Open', '\$${quote.openPrice.toStringAsFixed(2)}'),
          _buildStatItem('High', '\$${quote.highPrice.toStringAsFixed(2)}'),
          _buildStatItem('Low', '\$${quote.lowPrice.toStringAsFixed(2)}'),
          _buildStatItem('Prev Close', '\$${quote.previousClose.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildCompanyNews(List<CompanyNewsModel> news) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: news.length > 10 ? 10 : news.length,
      itemBuilder: (context, index) {
        return WatchlistNewsTile(
          article: news[index],
          onTap: () => _launchUrl(news[index].url),
        );
      },
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  Widget _buildTabBar(BuildContext context) {
    final tabs = ['1 Week', '1 Month', '1 Year'];

    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          // Bottom divider
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              color: AppColors.textFieldBackground,
            ),
          ),
          // Tabs
          Row(
            children: List.generate(
              tabs.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeTabIndex = index;
                    });
                    context.read<StockChartBloc>().add(
                      ChangeTimeRange(_getTimeRangeFromIndex(index)),
                    );
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _activeTabIndex == index ? AppColors.primaryTextColor : AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 2,
                          width: _activeTabIndex == index ? 60 : 0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
