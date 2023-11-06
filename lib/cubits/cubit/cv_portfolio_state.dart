part of 'cv_portfolio_cubit.dart';

@immutable
abstract class CvPortfolioState {}

class CvPortfolioInitial extends CvPortfolioState {}

class CvPortfolioSuccess extends CvPortfolioState {
  final File file;

  CvPortfolioSuccess(this.file);
}

class CvPortfolioLoading extends CvPortfolioState {}

class CvPortfolioFailure extends CvPortfolioState {
  final String errMessage;
  CvPortfolioFailure({required this.errMessage});
}
