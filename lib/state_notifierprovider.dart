import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/post_state.dart';

final exampleProvider = StateNotifierProvider<PostsNotifier, PostState>(
  (ref) {
    return PostsNotifier();
  },
);
