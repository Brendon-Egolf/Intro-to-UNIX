## Assignment: Project 7
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Store patient data for an emergency room

use strict;
use v6;
use lib '.';
use employee;

my Employee @employees;

sub main() {
  my Bool $continue = True;
  while $continue {
    @employees.push(getEmployee());
    $continue = getContinue;
  }
  printTotalYears;
}

sub getContinue returns Bool {
  my Str $continueResponse = '';
  my Bool $continue;
  until ($continueResponse ~~ /:i^(<[01ynqtf]>|yes|no|true|false)$/) {
    $continueResponse = prompt 'Would you like to continue? ';
  }
  $continue = ?($continueResponse ~~ /:i^(<[1yt]>|yes|true)$/);
  return $continue;
}

sub getEmployee() returns Employee {
  my @employeeData;
  my Str @promptLines = 'Department number (1-10)', 'ID number (1-5000)',
      'Years of service (1-40)';
  # my Regex @regexes = /^([1,10])$/, /^([1,5000])$/, /^([1,40])$/;
  my Range @ranges = (1..10), (1..5000), (1..40);
  for @promptLines.kv -> $i, $prompt {
    my Str $response = '';
    until ($response ~~ /^\d*$/ && $response ~~ @ranges[$i]) {
      $response = prompt "@promptLines[$i] ";
    }
    @employeeData.push($response);
  }
  my Employee $employee = Employee.new(|@employeeData);
  return $employee;
}

sub printTotalYears() {
  my Int $totalYears = 0;
  for @employees -> $employee {
    $totalYears += $employee.yearsOfService;
  }
  say "Total years: $totalYears";
}

main;
