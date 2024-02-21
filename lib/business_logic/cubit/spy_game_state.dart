part of 'spy_game_cubit.dart';

@immutable
abstract class SpyGameState {}

class SpyGameInitial extends SpyGameState {}

class AddPlayer extends SpyGameState {}

class RemovePlayer extends SpyGameState {}

class Play extends SpyGameState {}


class GetWord extends SpyGameState {}

class GetSpy extends SpyGameState {}


class CreateScoreBoard extends SpyGameState {}

class ChangeScoreBoard extends SpyGameState {}


class UpdateSpyWords extends SpyGameState {}


class Select extends SpyGameState {}
class Remove extends SpyGameState {}


class CheckCorrectAwnser extends SpyGameState{}
class isActive extends SpyGameState{}


class Reset extends SpyGameState{}



