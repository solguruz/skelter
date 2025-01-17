import 'dart:async';

typedef FutureCallback<T> = Future<T> Function();
typedef FutureOrCallback<T> = FutureOr<T> Function();

typedef SingleVoidCallback<T> = void Function(T e);
typedef SingleFutureCallback<T> = Future<void> Function(T e);
typedef SingleFutureOrCallback<T> = FutureOr<void> Function(T e);

typedef ReplaceValidator<T> = bool Function(T e);
typedef ReplaceValue<T> = T Function(T e);
