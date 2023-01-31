abstract class ExploreState {}

class ExploreInitial extends ExploreState {}

class ExploreGetPopularLoading extends ExploreState {}

class ExploreGetPopularSuccess extends ExploreState {}

class ExploreGetPopularError extends ExploreState {
  String error;
  ExploreGetPopularError(this.error);
}
