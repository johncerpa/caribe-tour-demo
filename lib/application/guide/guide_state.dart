part of 'guide_bloc.dart';

@freezed
abstract class GuideState with _$GuideState {
  factory GuideState.initial() => GuideState(guides: none());
  const factory GuideState({@required Option<List<Guide>> guides}) =
      _GuideState;
}
