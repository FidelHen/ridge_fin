import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ridge_fin/core/utils/app_colors.dart';
import 'package:ridge_fin/core/utils/app_dimensions.dart';
import 'package:ridge_fin/core/utils/app_images.dart';
import 'package:ridge_fin/core/widgets/status_image/status_image.dart';
import 'package:ridge_fin/features/watchlist/widgets/ticker_performance.dart';

@RoutePage()
class WatchlistStockQuotePage extends StatefulWidget {
  const WatchlistStockQuotePage({super.key});

  @override
  State<WatchlistStockQuotePage> createState() => _WatchlistStockQuotePageState();
}

class _WatchlistStockQuotePageState extends State<WatchlistStockQuotePage> {
  int _activeTabIndex = 0;
  bool isErrorState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: AppDimensions.spacing16),
        actions: [
          if (!isErrorState)
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star_outline,
                size: 28,
                fontWeight: FontWeight.w500,
                color: AppColors.iconColor,
              ),
            ),
        ],
        title: isErrorState
            ? null
            : Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.spacing20, vertical: AppDimensions.spacing8),
                child: Text('S&P 500', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
      ),
      body: SafeArea(
        child: isErrorState
            ? _buildEmptyState()
            : ListView(
                children: [
                  Padding(
                    padding: AppDimensions.getContentPadding(bottom: false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Standard and Poor\'s 500', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w500)),
                        Text(
                          '\$479.28',
                          style: GoogleFonts.robotoMono(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.positive),
                        ),
                        WatchlistTickerPerformance(),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.spacing24),
                  SizedBox(
                    height: 300,
                    child: Placeholder(
                      color: Colors.grey,
                    ),
                  ),
                  _buildTabBar(),
                  SizedBox(height: AppDimensions.spacing32),
                  Padding(
                    padding: AppDimensions.getContentPadding(bottom: false, top: false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Key Statistics', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: AppDimensions.spacing16),
                        _buildKeyStatistics(),
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimensions.spacing24),
                  Padding(
                    padding: AppDimensions.getContentPadding(bottom: false, top: false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Company News', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                        SizedBox(height: AppDimensions.spacing16),
                        _buildCompanyNews(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Align(
      alignment: Alignment(0, -0.6),
      child: StatusImage(
        imagePath: AppImages.errorState,
        title: 'Something went wrong',
        description: 'Sorry for the inconvenience, relax and check on us later.',
      ),
    );
  }

  Widget _buildKeyStatistics() {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Market Cap',
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.secondary),
              ),
              Text(
                '\$1.23T',
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Market Cap',
                style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.secondary),
              ),
              Text(
                '\$1.23T',
                style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyNews() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: AppDimensions.spacing12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.dividerColor),
            ),
            padding: EdgeInsets.all(AppDimensions.spacing14),
            child: Row(
              children: [
                Placeholder(
                  fallbackHeight: 42,
                  fallbackWidth: 42,
                ),
                SizedBox(width: AppDimensions.spacing16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Company News', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                      Text(
                        'Company News',
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.secondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabBar() {
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
                          color: AppColors.brandColor,
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
