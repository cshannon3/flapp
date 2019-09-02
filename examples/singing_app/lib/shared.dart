// Any list of music related stuff that might be accessed by multiple widgets

import 'package:flutter/material.dart';

List<String> notenames = [
  "C",
  "C#",
  "D",
  "D#",
  "E",
  "F",
  "F#",
  "G",
  "G#",
  "A",
  "A#",
  "B",
  "C"
];
List<String> majnames = [
  "C",
  "D",
  "E",
  "F",
  "G",
  "A",
  "B",
  "C"
];
List<int> sharps = [1, 3, 6, 8, 10];
List<double> majorscale = [0.0, 2.0, 4.0, 5.0, 7.0, 9.0, 11.0, 12.0, 14.0, 16.0, 17.0, 19.0, 21.0, 23.0, 24.0];
List<int> maj = [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24]; // major Scale
List<int> rootnotes = [4, 9, 14, 19, 23, 28];

List<String> tuningnames = <String>[
  'EADGBe',
  'DADGBe',
  'DADGBd',
  'DGDGBD',
  'GDAE',
  'FBDABD'
];
List<String> tonalnames = <String>['I', 'ii', 'iii', 'IV', 'V', 'vi', 'vii'];

List<List<int>> tunings = [
  [4, 9, 14, 19, 23, 28], [2, 9, 14, 19, 23, 28], // Drop D
  [2, 9, 14, 19, 23, 26], // Double drop d
  [2, 7, 14, 19, 23, 26], // open G
  [19, 26, 33, 40], // Mandolin
  [7, 11, 14, 19, 23, 26], // custom
];

List<String> scalenames = <String>[
  '',
  'Major',
  'Minor',
  'Harmonic',
  'Melodic',
  "Blues"
];

List<List<int>> scales = [
  [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24], // major Scale
  [0, 2, 3, 5, 7, 8, 10, 12, 14, 15, 17, 19, 20, 22, 24], // minor Scale
  [0, 2, 3, 5, 7, 8, 11, 12, 14, 15, 17, 19, 20, 23, 24], // harmonic
  [0, 2, 3, 5, 7, 9, 11, 12, 14, 15, 17, 19, 21, 23, 24], // melodic
  [0, 2, 3, 5, 6, 7, 11, 12, 14, 15, 17, 18, 19, 23, 24], // Blues scale
];

List<String> modenames = <String>[
  '',
  'Ionian',
  'Dorian',
  'Phrygian',
  'Lydian',
  'Mixolydian',
  'Aeolian',
  'Locrian'
];

List<List<int>> modes = [
  [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24], // Ionian
  [0, 2, 3, 5, 7, 8, 10, 12, 14, 15, 17, 19, 20, 22, 24], // Dorian
  [0, 1, 3, 5, 7, 8, 10, 12, 13, 15, 17, 19, 20, 22, 24], // Phrygian
  [0, 2, 4, 6, 7, 9, 11, 12, 14, 16, 18, 19, 21, 23, 24], // Lydian
  [0, 2, 4, 5, 7, 9, 10, 12, 14, 16, 17, 19, 21, 22, 24], // Mizolydian
  [0, 2, 3, 5, 7, 8, 10, 12, 14, 15, 17, 19, 20, 22, 24], // Aeolian
  [0, 1, 3, 5, 6, 8, 10, 12, 13, 15, 17, 18, 20, 22, 24], // Locrian
];

List<String> chordnames = <String>[
  '',
  'Major',
  'Minor',
  'dom7',
  'maj7',
  'sus2',
  'sus4',
  'dim',
  'aug',
  'min6',
  'min7',
  'min/maj7',
  'dim7',
  'halfdim'
];
List<List<int>> chords = [
  [0, 4, 7], // major chord
  [0, 3, 7], // minor chord
  [0, 4, 7, 10], // dom7
  [0, 4, 7, 11], // maj7
  [0, 4, 7, 9], // maj6
  [0, 2, 7], // sus2
  [0, 5, 7], // sus4
  [0, 3, 6, 9], // dim
  [0, 4, 8], //aug
  [0, 4, 8, 10], // aug7
  [0, 3, 7, 9], // min6
  [0, 3, 7, 10], // min7
  [0, 3, 7, 11], // min/maj7
  [0, 3, 6, 9], //dim7
  [0, 3, 6, 10], // halfdim
];

Color getColor(double tnote) {
  return Color.lerp(Colors.red, Colors.blue, tnote / 12);
}
Color getAccuracyColor(double difference) {
  difference = difference.abs();
  if (difference>2.0){difference=2.0;}
  return Color.lerp(Colors.green, Colors.red,  difference / 2.0);
}

List<int> buildscalenoteslist(int _root, int _currentscale) {
  List<int> scale = [];
  for (int i = 0; i < 7; i++) {
    scale.add((_root + scales[_currentscale][i]) % 12);
  }
  return scale;
}

List<int> buildhighlights(int _root, int _currentscale, int _tonalhighlight) {
  List<int> _highlightnotes = [];
  for (int u = 0; u < 6; u += 2) {
    _highlightnotes
        .add((_root + scales[_currentscale][_tonalhighlight + u]) % 12);
  }

  return _highlightnotes;
}
