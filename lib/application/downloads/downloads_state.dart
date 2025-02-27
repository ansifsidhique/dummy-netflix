part of 'downloads_bloc.dart';

@freezed
 class DownloadsState with _$DownloadsState {
  const factory DownloadsState(
      {required bool isLoading,
      required List<Downloads> downloads,
      required Option<Either<MainFailure, List<Downloads>>> downloadFailureOrSuccess,

         }) = _DownloadState;

  factory DownloadsState.initial() {
    return DownloadsState(
        isLoading: false,
        downloads: [],
        downloadFailureOrSuccess: none(),
    );
  }
}
