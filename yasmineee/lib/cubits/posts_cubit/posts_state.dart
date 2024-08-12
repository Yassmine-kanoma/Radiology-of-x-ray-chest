

abstract class PostsState {
  const PostsState();
}

final class PostsInitialState extends PostsState {}

class AddPostsLoadingState extends PostsState {}

class AddPostsSuccessState extends PostsState {
  final String message;

  const AddPostsSuccessState(this.message);
}

class AddPostsFailureState extends PostsState {
  final String error;

  const AddPostsFailureState(this.error);
}
