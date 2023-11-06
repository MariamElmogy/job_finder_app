part of 'image_portfolio_cubit.dart';

@immutable
abstract class ImagePortfolioState {}

class ImagePortfolioInitial extends ImagePortfolioState {}

class ImagePortfolioSuccess extends ImagePortfolioState {
  final String imageUrl;
  
  ImagePortfolioSuccess(this.imageUrl);
}

class ImagePortfolioLoading extends ImagePortfolioState {}

class ImagePortfolioFailure extends ImagePortfolioState {
  final String errMessage;
  ImagePortfolioFailure({required this.errMessage});
}
