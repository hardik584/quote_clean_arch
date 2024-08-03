import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:quote_clean_code/features/quote/presentation/blocs/quote_bloc.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: BlocProvider(
        create: (_) => GetIt.I<QuoteBloc>()..add(FetchQuotes()),
        child: const QuoteList(),
      ),
    );
  }
}

class QuoteList extends StatelessWidget {
  const QuoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(
      builder: (context, state) {
        if (state is QuoteLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuoteLoaded) {
          return ListView.builder(
            itemCount: state.quotes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.quotes[index].text),
                subtitle: Text(state.quotes[index].author),
              );
            },
          );
        } else if (state is QuoteError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
