import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/config/app_router.gr.dart';
import 'package:ridge_fin/core/di/injection.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';
import 'package:ridge_fin/features/watchlist/bloc/search_stock_bloc.dart';
import 'package:ridge_fin/features/watchlist/repositories/ticker_repository.dart';
import 'package:ridge_fin/features/watchlist/widgets/ticker_tile.dart';

@RoutePage()
class WatchlistSearchStockPage extends StatelessWidget {
  const WatchlistSearchStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchStockBloc(getIt<TickerRepository>()),
      child: const _WatchlistSearchStockView(),
    );
  }
}

class _WatchlistSearchStockView extends StatefulWidget {
  const _WatchlistSearchStockView();

  @override
  State<_WatchlistSearchStockView> createState() => _WatchlistSearchStockViewState();
}

class _WatchlistSearchStockViewState extends State<_WatchlistSearchStockView> {
  final TextEditingController _searchController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String? value) {
    if (value != null) {
      context.read<SearchStockBloc>().add(SearchQueryChanged(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Stocks',
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.getContentPadding(),
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: RidgeTextField(
                  name: 'search',
                  hint: 'Search for a stock',
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  autoFocus: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  suffix: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.iconColor,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.spacing4),
              Expanded(
                child: BlocBuilder<SearchStockBloc, SearchStockState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      success: (tickers) => ListView.builder(
                        padding: EdgeInsets.only(top: AppDimensions.spacing4),
                        itemCount: tickers.length,
                        itemBuilder: (context, index) {
                          final ticker = tickers[index];
                          return WatchlistTickerTile(
                            title: ticker.ticker,
                            description: ticker.title,
                            onTap: () {
                              context.router.push(
                                const WatchlistStockQuoteRoute(),
                              );
                            },
                          );
                        },
                      ),
                      empty: () => Center(
                        child: Text(
                          'No stocks found',
                          style: GoogleFonts.inter(
                            color: AppColors.secondary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      error: (message) => Center(
                        child: Text(
                          message,
                          style: GoogleFonts.inter(
                            color: AppColors.negative,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
