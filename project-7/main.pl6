## Assignment: Project 7
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Store patient data for an emergency room

use strict;
use v6;
use lib '.';
use patient;

my Patient @patients;
my @menuItems =
  &addPatient,
  &printPatients,
  &printUninsured,
  &writeUninsured,
  &exit;

sub main() {
  loadPatients('patient-data.csv');
  repeat {
    my &selection = getSelection();
    clear;
    &selection();
  } while True;
}

sub getSelection() {
  clear;
  printMenu();
  my $selection = prompt 'Select menu option: ';
  if ($selection ~~ /:i^<[0..4]>$/) { #TODO: change this if an option is added or removed
    return @menuItems[$selection];
  } else {
    clear;
    say 'Invalid selection';
    sleep 1;
    return getSelection();
  }
}

sub clear() {
  run 'clear';
}

sub loadPatients(Str $patientData) {
  my @lines = $patientData.IO.lines;
  constant DATE_OF_BIRTH = 3;
  for @lines.kv -> $lineNumber, $line {
    # say $line;
    my @patientData = $line.split(",");
    # say @patientData;
    # say @patientData.elems;
    @patientData[DATE_OF_BIRTH] = Date.new(@patientData[DATE_OF_BIRTH]).Date;
    if @patientData.elems == 7 {
      @patients.push(Patient.new(|@patientData));
    } else {
      say "Patient $lineNumber invalid data";
    }
  }
}

sub printMenu() {
    for @menuItems.kv -> $optionNumber, $option {
      print "$optionNumber ";
      with $option.WHY {
        say $option.WHY;
      } else {
        say "Exit";
      }
    }
}

sub writeUninsured() {
  #= Write uninsured
  my $uninsuredFile = open('uninsured-patients.csv', :w);
  say "writing uninsured patients to $uninsuredFile";
  for @patients.kv -> $idx, $patient {
    if $patient.insurance eq 'none' {
      if $idx < (@patients.elems - 1) {
        $uninsuredFile.print("$patient\n");
      } else {
        $uninsuredFile.print("$patient");
      }
    }
  }
}

sub printUninsured() {
  #= Print uninsured
  for @patients -> $patient {
    if $patient.insurance eq 'none' {
      $patient.print
    }
  }
  pause;
}

sub printPatients() {
  #= Print patients
  for @patients {
    .print;
  }
  pause;
}

sub pause() {
  prompt 'press enter to continue';
}

sub addPatient() {
  #= Add patient
  my @promptLines = 'Last name', 'First name', 'Middle', 'Date of birth', 'Insurance carrier or none', 'Ailment', 'pin';
  constant DATE_OF_BIRTH = 3;
  constant PIN = 6;
  my @patientData[7];
  for @promptLines.kv -> $i, $prompt {
    my $regex;
    if $i == 3 {
      $regex = /^\d**4 <:Pd> <[01]>\d <:Pd> <[0..3]>\d$/;
    } elsif $i == 6 {
      $regex = /^\d**4$/;
    } else {
      $regex = /:i^<[a..z\s]>+$/;
    }
    while True {
      @patientData[$i] = prompt "Please enter the patient's $prompt: ";
      last if @patientData[$i] ~~ $regex;
      say 'Invalid input';
    }
  }
  @patientData[DATE_OF_BIRTH] = Date.new(@patientData[DATE_OF_BIRTH]).Date;
  my $patient = Patient.new(|@patientData);
  @patients.push($patient);
}

sub getContinue() returns Bool {
  my $continue;
  without $continue {
    $continue = prompt 'do you want to continue? ';
    if !($continue ~~ /:i^(<[01ynq]>|yes|no)$/) { #perl 6 regexes are weird
      return getContinue();
    }
    $continue = ?($continue ~~ /:i^(<[1y]>|yes)$/);
    # say $continue;
  }
  return $continue;
}

main();
