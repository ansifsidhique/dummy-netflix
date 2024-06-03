import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/core/failure/main_failures.dart';

import '../../domain/downloads/i_dowloads_repo.dat.dart';
import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/models/search_response.dart';
import '../../domain/search/search_service.dart';
part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final SearchService _searchService;
  SearchBloc(this._downloadsRepo, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idlelist.isNotEmpty) {
        emit(SearchState(
            searchResultResult: [],
            idlelist: state.idlelist,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultResult: [],
          idlelist: [],
          isLoading: true,
          isError: false));
      //   get trending
      final result = await _downloadsRepo.getDownloadsImage();
      final _state = result.fold((MainFailure f) {
        return const SearchState(
            searchResultResult: [],
            idlelist: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultResult: [],
            idlelist: list,
            isLoading: false,
            isError: false);
      });
      emit(_state);
      //   show to ui
    });
    on<SearchMovie>((event, emit) async {
      //   call searchMovie
      log("search in log${event.movieQuery}");
      emit(const SearchState(
          searchResultResult: [],
          idlelist: [],
          isLoading: true,
          isError: false));

      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = result.fold((MainFailure f) {
        return const SearchState(
            searchResultResult: [],
            idlelist: [],
            isLoading: false,
            isError: true);
      }, (SearchResponse r) {
        return SearchState(
            searchResultResult: r.results,
            idlelist: [],
            isLoading: false,
            isError: false);
      },);
      emit(_state);
      //   show to ui
    });
  }
}
