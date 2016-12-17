## Assignment: Final Exam
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Hang Man game

use strict;
use v6;
use lib '.';

my Int $falseGuesses;
my Str $word;
my Str @guessedLetters;
my Int $MAX_GUESSES := 6;

sub main() {
  my $correctLetters = 0;
  my Bool $win = False;
  my Bool $lose = False;
  $word = getWord;
  clear;
  printWelcome;
  pause;
  until ($win || $lose) {
    clear;
    $falseGuesses = getFalseGuesses;
    printGallows;
    $lose = ($falseGuesses >= $MAX_GUESSES);
    if !($lose) {
      my Str $printWord = getPrintWord;
      printWord($printWord);
      $correctLetters = getCorrectLetters($printWord);
    } else {
      say "$word\n";
    }
    printGuessedLetters;
    # say($correctLetters,',', $word.chars);
    $win = ($correctLetters >= $word.chars);
    unless ($win || $lose) {
      @guessedLetters.push(getLetter);
    }
  }
  if $win {
    printWin;
  }
}

sub printWin() {
  printFile('win');
}

sub printGuessedLetters() {
  say 'GUESSED LETTERS';
  say '------------------------------------';
  for @guessedLetters -> $letter {
    print "$letter ";
  }
  print "\n";
  say '------------------------------------';
  print "\n";
}

sub getLetter() returns Str {
  my Str $letter = '';
  my Bool $duplicate = True;
  until ($letter ~~ /^<:L>$/ && !$duplicate) {
    $letter = prompt 'Please enter the letter you want to guess: ';
    $duplicate = False;
    for @guessedLetters -> $currentLetter {
      $duplicate = ($letter eq $currentLetter);
      last if $duplicate;
    }
  }
  say 'left loop';
  return $letter;
}

# sub contains(Str $word, Str $letter) returns Bool {
#   my Bool $contains;
#   $contains = ?(+$word.comb: /$letter/);
#   say $contains;
#   return $contains;
# }

sub clear() {
  shell 'clear';
}

sub getFalseGuesses() returns Int {
  my Int $falseGuesses;
  $falseGuesses = @guessedLetters.elems - getCorrectGuesses;
  # say $falseGuesses;
  return $falseGuesses;
}

sub getCorrectGuesses() returns Int {
  my Int $correctGuesses = 0;
  for @guessedLetters -> $letter {
    # say "testing letter $letter";
    if $word.contains($letter) {
      # say "matched letter $letter";
      $correctGuesses++;
    }
  }
  return $correctGuesses;
}

sub getCorrectLetters(Str $printWord) returns Int {
  my Int $correctLetters = 0;
  loop (my Int $i = 0; $i < $printWord.chars; $i++) {
    # say('testing letter substr', substr($printWord, $i, 1));
    unless $printWord.substr-eq('_', $i) {
      $correctLetters++;
    }
  }
  return $correctLetters;
}

sub getPrintWord() returns Str {
  my Str $printWord = '';
  loop (my Int $i = 0; $i < $word.chars; $i++) {
    my Bool $match = False;
    for @guessedLetters -> Str $currentLetter {
      $match = $word.substr-eq($currentLetter, $i);
      last if $match;
    }
    if $match {
      $printWord ~= substr($word, $i, 1);
    } else {
      $printWord ~= '_';
    }
  }
  return $printWord;
}

sub printWord(Str $word) {
  print "\n";
  print $word;
  print "\n\n";
}

sub getLetterCount() returns Int {
  my Int $count = $word.chars;
  say $count;
  return $count;
}

sub printWelcome() {
  printFile('welcome-page');
}

sub pause() {
  prompt '';
}

sub printGallows() {
  my Str @levels = 'gallows', 'head', 'body', 'left-arm', 'right-arm', 'right-leg', 'left-leg';
  printFile(@levels[$falseGuesses]);
}

sub printFile(Str $fileName) {
  shell "cat $fileName";
}

sub getWord() returns Str {
  my Str $word = qqx 'shuf -n 1 corncob_lowercase.txt';
  $word = $word.chomp;
  # say $word;
  return $word;
}

main;
