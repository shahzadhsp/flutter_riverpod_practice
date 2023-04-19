// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/http_get_post.dart';

import 'package:flutter_riverpod_practice/model_class.dart';

@immutable
abstract class PostState {}

@immutable
class InitialPostsState extends PostState {}

@immutable
class PostsLoadingPostState extends PostState {}

class PostsLoadedPostsState extends PostState {
  final List<PostsModel> postsModel;
  PostsLoadedPostsState({
    required this.postsModel,
  });
}
class ErrorPostsState extends PostState {
  final String message;
  ErrorPostsState({
    required this.message,
  });
  
}
class PostsNotifier extends StateNotifier<PostState>{
  PostsNotifier() : super(InitialPostsState());
  final HttpGetPost _httpGetPost= HttpGetPost();

  void fetchPosts()async{
    try {
      state= PostsLoadingPostState();
      List<PostsModel> postsModel  =await _httpGetPost.fetchPosts();
      state= PostsLoadedPostsState(postsModel: postsModel);
    } catch (e) {
      state = ErrorPostsState(message: e.toString());
    }
  }
}