import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/features/watchlist/bloc/stock_chart_bloc.dart';
import 'package:ridge_fin/features/watchlist/models/stock_price_model.dart';

class WatchlistStockChart extends StatelessWidget {
  final List<StockPriceModel> historicalPrices;

  const WatchlistStockChart({
    super.key,
    required this.historicalPrices,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockChartBloc, StockChartState>(
      builder: (context, state) {
        final data = state.maybeWhen(
          loaded: (filteredData, _, __, ___, ____, _____) => filteredData,
          orElse: () => historicalPrices,
        );

        return state.maybeWhen(
          loaded: (_, timeRange, currentPrice, performance, displayDate, selectedIndex) {
            final startPrice = data.isNotEmpty ? data.first.price : 0.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppDimensions.getContentPadding(bottom: false, top: false),
                  child: _buildPriceHeader(currentPrice, performance, displayDate, startPrice),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: _buildChart(context, data, selectedIndex),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(
            child: Text(
              message,
              style: GoogleFonts.inter(color: AppColors.negative),
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildPriceHeader(double price, double performance, String date, double startPrice) {
    final isPositive = performance >= 0;
    final dollarChange = price - startPrice;
    final formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.parse(date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedFlipCounter(
          duration: Duration(milliseconds: 300),
          value: price,
          fractionDigits: 2,
          prefix: '\$',
          textStyle: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryTextColor,
          ),
        ),

        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              size: 16,
              fontWeight: FontWeight.w600,
              color: isPositive ? AppColors.positive : AppColors.negative,
            ),
            const SizedBox(width: 4),
            Text(
              '\$${dollarChange.abs().toStringAsFixed(2)} (${performance.abs().toStringAsFixed(2)}%)',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isPositive ? AppColors.positive : AppColors.negative,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              formattedDate,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildChart(BuildContext context, List<StockPriceModel> data, int? selectedIndex) {
    if (data.isEmpty) return const SizedBox.shrink();

    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.price);
    }).toList();

    final minPrice = data.map((e) => e.price).reduce((a, b) => a < b ? a : b);
    final maxPrice = data.map((e) => e.price).reduce((a, b) => a > b ? a : b);
    final priceRange = maxPrice - minPrice;
    final padding = priceRange * 0.1;

    // Determine if overall trend is positive
    final isPositive = data.last.price >= data.first.price;
    final lineColor = isPositive ? AppColors.positive : AppColors.negative;

    return LayoutBuilder(
      builder: (context, constraints) {
        return LineChart(
          LineChartData(
            minX: 0,
            maxX: (data.length - 1).toDouble(),
            minY: minPrice - padding,
            maxY: maxPrice + padding,
            lineTouchData: LineTouchData(
              enabled: true,
              touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                if (event is FlPanEndEvent || event is FlTapUpEvent) {
                  context.read<StockChartBloc>().add(const UpdateSelectedPoint(null));
                  return;
                }

                if (touchResponse == null || touchResponse.lineBarSpots == null) {
                  return;
                }

                final spot = touchResponse.lineBarSpots!.first;
                context.read<StockChartBloc>().add(UpdateSelectedPoint(spot.x.toInt()));
              },
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (touchedSpot) => Colors.transparent,
                tooltipPadding: EdgeInsets.zero,
                tooltipMargin: 0,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((spot) => null).toList();
                },
              ),
              getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((spotIndex) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: AppColors.secondary.withValues(alpha: 0.2),
                      strokeWidth: 1.5,
                      dashArray: null,
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: lineColor,
                          strokeWidth: 0,
                        );
                      },
                    ),
                  );
                }).toList();
              },
            ),
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                curveSmoothness: 0.35,
                preventCurveOverShooting: true,
                color: lineColor,
                barWidth: 2.5,
                dotData: FlDotData(
                  show: selectedIndex == null,
                  checkToShowDot: (spot, barData) {
                    return spot.x == (data.length - 1).toDouble();
                  },
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 5,
                      color: lineColor,
                      strokeWidth: 0,
                    );
                  },
                ),
                belowBarData: BarAreaData(
                  show: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
