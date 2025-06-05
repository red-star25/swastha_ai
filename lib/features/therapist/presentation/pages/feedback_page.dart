import 'package:flutter/material.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/constants/text_theme.dart';

class FeedbackPage extends StatefulWidget {
  final String therapistName;
  const FeedbackPage({super.key, required this.therapistName});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final double _rating = 4.0;
  final int _reviewCount = 120;
  final double _averageRating = 4.5;
  final Map<int, int> _ratingPercentages = {5: 40, 4: 30, 3: 15, 2: 10, 1: 5};
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'How was your session with ${widget.therapistName}?',
              style: AppTextTheme.h4.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Your feedback helps us improve the experience for everyone.',
              style: AppTextTheme.bodyMedium.copyWith(
                fontSize: 17,
                color: AppColors.darkGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _averageRating.toStringAsFixed(1),
                      style: AppTextTheme.h4.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: AppColors.primary,
                          size: 24,
                        );
                      }),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$_reviewCount reviews',
                      style: AppTextTheme.bodyMedium.copyWith(
                        color: AppColors.darkGrey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    children:
                        _ratingPercentages.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Text(
                                  entry.key.toString(),
                                  style: AppTextTheme.bodyMedium.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFD6DBF5),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      FractionallySizedBox(
                                        widthFactor: entry.value / 100,
                                        child: Container(
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${entry.value}%',
                                  style: AppTextTheme.bodyMedium.copyWith(
                                    color: AppColors.darkGrey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD6DBF5)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: _controller,
                minLines: 5,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Write your feedback...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: SizedBox(
                width: 240,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Submit Feedback',
                    style: AppTextTheme.button.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
