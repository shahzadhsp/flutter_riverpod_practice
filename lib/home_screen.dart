import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/model_class.dart';
import 'package:flutter_riverpod_practice/post_state.dart';
import 'package:flutter_riverpod_practice/state_notifierprovider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fetch Json Api With Riverpod',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            PostState state = ref.watch(exampleProvider);
            if (state is InitialPostsState) {
              return Text('Press FAB to Fetch Data',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange));
            }
            if (state is PostsLoadingPostState) {
              return CircularProgressIndicator();
            }
            if (state is ErrorPostsState) {
              return Text(state.toString());
            }
            if (state is PostsLoadedPostsState) {
              return ListView.builder(
                itemCount: state.postsModel.length,
                itemBuilder: (context, index) {
                  PostsModel postsModel = state.postsModel[index];
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 2),
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.pink[100],
                      elevation: 4,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink[100],
                          child: Text(
                            postsModel.userId.toString(),
                            style: TextStyle(color: Colors.pink[50]),
                          ),
                        ),
                        title: Text('Title\n' + postsModel.title.toString()),
                        subtitle: Text(
                          'Description\n' + postsModel.body.toString(),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Text('Data Not Found');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(exampleProvider.notifier).fetchPosts();
        },
        child: Icon(Icons.featured_play_list),
      ),
    );
  }
}
