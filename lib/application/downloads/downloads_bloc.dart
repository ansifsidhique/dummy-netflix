import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failure/main_failures.dart';

import '../../domain/downloads/i_dowloads_repo.dat.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _iDownloadsRepo;
  DownloadsBloc(this._iDownloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {

      emit(state.copyWith(
          isLoading: true, downloadFailureOrSuccess: none(), downloads: []));

      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _iDownloadsRepo.getDownloadsImage();
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false, downloadFailureOrSuccess: some(left(failure))),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadFailureOrSuccess: some(right(success)),
          ),
        ),
      );
    });
  }
}
