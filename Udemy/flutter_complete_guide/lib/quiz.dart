import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'],);
        }).toList(), /*Vettünk egy Map-et, amiben szükségünk van az 'answer'-höz tartozó válaszokra, ami egy lista.
                       Amit mi szeretnénk, az az, hogy a listában szereplő elemeket ElevatedButton-ökké alakítsuk,
                       mindezt úgy, hogy a külön gombokon lévő válaszok, csak a hozzá/hozzájuk tartozó kérdéssel együtt 
                       jelenjenek meg. 
                       A .map() metódus segítségével be tudjuk járni a Map-et, viszont előtte meg kell adni, hogy
                       melyik indexű tagnál járunk, és hogy annak a key, vagy a value elemét szeretnénk megkapni.
                       Önmagában nem ismeri fel a dart, hogy az 'answer'-höz egy List van hozzárendelve, ezért addig 
                       a pontig ()-be raktuk az "utat", majd szóltunk a dart-nak, hogy ő az "út" végén megkapott elemet
                       egy Stringeket tartalmazó List-ként (as List<String>) kezelje.
                       Ezekután a map egy anoním függvényt vár bemeneti értékként, ami nem lesz más, mint az útvonalról
                       elért érték, jelen esetünkben egy String típusú listaelem.
                       Majd megadjuk a visszatérési értéket, ami nem lesz más, mint egy Answer widget.
                       Ezen felül mindezt egy listává kell konvertálni (.toList()), ekkor kapunk egy Answer Widget típusú listát,
                       ugyanakkor mi ennek egyes elemeit szeretnénk megkapni, ezt pedig az ún. spread operator (...) segítségével
                       tehetjük meg, ami tulajdonképpen arra jó, hogy egy már meglévő lista elemeit kiemeli, és egyesével
                       ahogyan/ahova mi szeretnénk lerakja.*/
      ],
    );
  }
}
