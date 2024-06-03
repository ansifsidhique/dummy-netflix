import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/downloads/i_dowloads_repo.dat.dart';
import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  IDownloadsRepo _downloadsRepo;
  FastLaughBloc(this._downloadsRepo) : super( FastLaughState.initial()) {
    on<Initialize>((event, emit) {
    // get trending movies


    //   send to ui
    });
  }
}
