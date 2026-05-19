import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_homework/lesson_19/bloc/rate_app_state.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter lab', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1B3D70),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: const Color(0xFFA5E0FF),
      body: BlocConsumer<RateAppCubit, RateAppState>(
        listener: (context, state) {
          if (state.status == RateAppStatus.success) {
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(buildSnackBar());
          }
        },
        builder: (context, state) {
          final cubit = context.read<RateAppCubit>();
          final isLoading = state.status == RateAppStatus.loading;
          final isSuccess = state.status == RateAppStatus.success;

          return Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 48.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    114,
                    193,
                    250,
                  ).withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isSuccess
                          ? 'You rated the app'
                          : 'How would you rate the app?',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B3D70),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final isFullStar = index < state.rating;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: (isSuccess || isLoading)
                                ? null
                                : () => cubit.selectRating(index + 1),
                            child: Image.asset(
                              isFullStar
                                  ? 'assets/images/starfull_19.png'
                                  : 'assets/images/starclean_19.png',
                              width: 32,
                              height: 32,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                    if (isSuccess) ...[
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B3D70),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => cubit.rateAgain(),
                          child: const Text(
                            'Rate again',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 46,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1B3D70),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: (isLoading || state.rating == 0)
                                    ? null
                                    : () => cubit.submitRating(),
                                child: isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Text(
                                        'Submit rating',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: SizedBox(
                              height: 46,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF41A6F4),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () => cubit.resetRating(),
                                icon: const Icon(
                                  Icons.refresh,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'Reset rating',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

SnackBar buildSnackBar() {
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/smalstar.png', width: 18, height: 18),
        SizedBox(width: 8),
        const Text(
          'Your rating has been submitted successfully!',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 8),
        Image.asset('assets/images/smalstar.png', width: 18, height: 18),
      ],
    ),
    backgroundColor: const Color(0xFF41A6F4),
    duration: const Duration(seconds: 3),
    elevation: 4,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
  );
}
