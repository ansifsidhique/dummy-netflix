import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constant_height_and%20width.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

import '../../application/search/search_bloc.dart';

class ScreenSearchPage extends StatelessWidget {
  const ScreenSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
     */
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                BlocProvider.of<SearchBloc>(context).add(
                    SearchMovie(movieQuery: value));
              },
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
            ),
            kHeight,
            // const SearchIdleWidget()
             Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if(state.searchResultResult.isEmpty){
                  return const SearchIdleWidget();
                }
                else{
                  return const SearchResultWidget();
                }

              },
            ))
          ],
        ),
      ),
    );
  }
}
