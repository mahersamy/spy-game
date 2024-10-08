import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spy_game/data/models/category_model.dart';


part 'spy_game_state.dart';

class SpyGameCubit extends Cubit<SpyGameState> {
  SpyGameCubit() : super(SpyGameInitial());
  String word = "";
  String spy = "";
  late CategoryModel category;
  List<String> players = [];
  List<String> asks = [];
  List<String> awnsers = [];
  List<List<String>> asksAndAwnsers = [];
  List<int> score = [];
  List<String> spyWordsRes = [];
  List<String> updateListWord = [];

  Color correctAwnser = Colors.green;
  Color wrongAwnser = Colors.red;
  bool activeButton = true;

  void createScoreBoard() {
    print("score");
    if (score.isEmpty) {
      score = List.generate(players.length, (index) => 0);
    }
    emit(CreateScoreBoard());
  }

  void changeScoreBoard(String name, String spyName) {
    if (spyName == spy) {
      for (int i = 0; i < players.length; i++) {
        if (name == players[i]) {
          score[i] = score[i] + 100;
        }
      }
    }
    emit(ChangeScoreBoard());
  }

  void addPlayer(String player) {
    players.add(player);
    asks.add(player);
    awnsers.add(player);
    emit(AddPlayer());
  }

  void removePlayer(int index) {
    players.removeAt(index);
    asks.removeAt(index);
    awnsers.removeAt(index);
    emit(RemovePlayer());
  }

  bool isplayer3() {
    return asks.length >= 3;
  }

  String getWord() {
    Random random = Random();
    int randomNumber = random.nextInt((category.listOfWords.length - 1));
    word = category.listOfWords[randomNumber];
    emit(GetWord());
    return word;
  }

  String getSpy() {
    Random random = Random();
    int randomNumber = random.nextInt((asks.length));

    if (spy == asks[randomNumber]) {
      int x = random.nextInt(1);
      if (x == 0) {
        randomNumber = random.nextInt((asks.length));
      }
    } else {
      spy = asks[randomNumber];
    }
    emit(GetSpy());
    return asks[randomNumber];
  }

  void play() {
    if (asks.isNotEmpty) {
      Random random = Random();
      int randomNumberForAsks = random.nextInt(asks.length);
      int randomNumberForAnswer = random.nextInt(awnsers.length);
      if (asks.length == 1 &&
          awnsers.length == 1 &&
          asks[randomNumberForAsks] == awnsers[randomNumberForAnswer]) {
        asksAndAwnsers.add([asks[randomNumberForAsks], "اي شخص"]);
      } else if (asks.length == 1 &&
          awnsers.length == 1 &&
          asks[randomNumberForAsks] != awnsers[randomNumberForAnswer]) {
        asksAndAwnsers
            .add([asks[randomNumberForAsks], awnsers[randomNumberForAnswer]]);
      } else if (randomNumberForAsks == 0 &&
          randomNumberForAnswer == 0 &&
          awnsers.length >= 2 &&
          asks[randomNumberForAsks] == awnsers[randomNumberForAnswer]) {
        randomNumberForAnswer++;
        asksAndAwnsers
            .add([asks[randomNumberForAsks], awnsers[randomNumberForAnswer]]);
      } else if (randomNumberForAsks == asks.length - 1 &&
          randomNumberForAnswer == awnsers.length - 1 &&
          awnsers.length >= 2 &&
          asks[randomNumberForAsks] == awnsers[randomNumberForAnswer]) {
        randomNumberForAnswer--;
        asksAndAwnsers
            .add([asks[randomNumberForAsks], awnsers[randomNumberForAnswer]]);
      } else if (asks[randomNumberForAsks] == awnsers[randomNumberForAnswer]) {
        int rand = random.nextInt(2);
        rand == 1 ? randomNumberForAnswer++ : randomNumberForAnswer--;
        asksAndAwnsers
            .add([asks[randomNumberForAsks], awnsers[randomNumberForAnswer]]);
      } else if (asks[randomNumberForAsks] == awnsers[randomNumberForAnswer] &&
          asks.length == 1 &&
          awnsers.length == 1) {
        asksAndAwnsers.add([asks[randomNumberForAsks], "اي شخص"]);
      } else {
        asksAndAwnsers
            .add([asks[randomNumberForAsks], awnsers[randomNumberForAnswer]]);
      }
      asks.removeAt(randomNumberForAsks);
      awnsers.removeAt(randomNumberForAnswer);
      emit(Play());
    }
  }

  void autoPlay() {
    asksAndAwnsers = [];
    for (int i = 0; i < players.length; i++) {
      play();
    }
  }

  void updateSpyWordsSelect(List<String> spyWords) {
    updateListWord = List.from(spyWords);
    emit(UpdateSpyWords());
  }

  void select() {
    spyWordsRes = [];
    updateListWord.remove(word);
    Random random = Random();
    int randomNum = random.nextInt(10);
    for (int i = 0; i < 10; i++) {
      if (randomNum == i) {
        spyWordsRes.add(word);
      } else {
        int randomNum2 = random.nextInt(updateListWord.length);
        spyWordsRes.add(updateListWord[randomNum2]);
        updateListWord.removeAt(randomNum2);
      }
    }
    emit(Select());
  }



  void changeActive(String spyWord) {
    activeButton = !activeButton;
    if (spyWord == word) {
      for (int i = 0; i < players.length; i++) {
        if (players[i] == spy) {
          score[i] = score[i] + 100;
          break;
        }
      }
    }

    emit(isActive());
  }

  Color checkCorrectAwnser(String spyWord) {
    if (spyWord == word) {
      emit(CheckCorrectAwnser());
      return correctAwnser;
    } else {
      emit(CheckCorrectAwnser());
      return wrongAwnser;
    }
  }

  void reset() {
    activeButton = true;
    word = "";
    spy = "";
    players = [];
    asks = [];
    awnsers = [];
    asksAndAwnsers = [];
    score = [];
    spyWordsRes = [];
    updateListWord = [];
    emit(Reset());
  }

  void continuePlay() {
    activeButton = true;
    word = "";
    spy = "";
    asks = List.from(players);
    awnsers = List.from(players);
    getWord();
    updateSpyWordsSelect(category.listOfWords);
    select();
    getSpy();
    createScoreBoard();
  }
}
