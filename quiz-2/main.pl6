## Assignment: Project 7
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Store patient data for an emergency room

use strict;
use v6;
use lib '.';

sub main() {
  Bool $continue = True;
  while $continue {
    addEmployee();
  }
}

sub addEmployee() {
  my @promptLines = 'Department number', 'ID number', 'Years of service';
  my @regexes = /([1,10])/, /([1-5000])/, /([1,40])/;
  for @promptLines.kv -> $i, $prompt {
  }
}
