import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/widgets/input_fields/ridge_text_field.dart';
import 'package:ridge_fin/features/watchlist/widgets/ticker_tile.dart';

@RoutePage()
class WatchlistSearchStockPage extends StatefulWidget {
  const WatchlistSearchStockPage({super.key});

  @override
  State<WatchlistSearchStockPage> createState() => _WatchlistSearchStockPageState();
}

class _WatchlistSearchStockPageState extends State<WatchlistSearchStockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Stock'),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.getContentPadding(),
          child: Column(
            children: [
              RidgeTextField(
                name: 'search',
                hint: 'Search for a stock',
                suffix: Icon(Icons.search, size: 20, color: AppColors.iconColor),
              ),
              SizedBox(height: AppDimensions.spacing4),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: AppDimensions.spacing4),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return WatchlistTickerTile(
                      title: 'S&P 500',
                      description: 'Standard and Poor\'s 500',
                      trailing: Icon(Icons.add_circle_outline, size: 24, color: AppColors.positive),
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
