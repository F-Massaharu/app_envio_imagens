import 'dart:async';

import 'package:app_envio_imagens/storage/database_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _streamSubscription;

  ImageBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(ImagesLoading());

  @override
  Stream<ImageState> mapEventToState(ImageEvent event) async* {
    if (event is LoadImages) {
      yield* _mapLoadImagesToState();
    }
    if (event is UpdateImages) {
      yield* _mapUpdateImagesToStateEvent(event);
    }
  }

  Stream<ImageState> _mapLoadImagesToState() async* {
    _streamSubscription?.cancel();

    _databaseRepository.getUser().listen(
          (user) => add(
            UpdateImages(user.imageUrls),
          ),
        );
  }

  Stream<ImageState> _mapUpdateImagesToStateEvent(UpdateImages event) async* {
    yield ImagesLoaded(imageUrls: event.imageUrls);
  }
}
