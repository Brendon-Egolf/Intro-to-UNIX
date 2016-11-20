## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Represent patient data as an object

unit module patient;
use strict;

class Patient is export {
  has Str $.lastName;
  has Str $.firstName;
  has Str $.middleName;
  has Date $.dateOfBirth;
  has Str $.insurance;
  has Str $.ailment;
  has Str $.pin;
  has Int $.age;

  method new($lastName, $firstName, $middleName, $dateOfBirth, $insurance, $ailment, $pin) {
    self.bless(:$lastName, :$firstName, :$middleName, :$dateOfBirth, :$insurance, :$ailment, :$pin);
  }

  # submethod BUILD(Str @patientData) {
  #   $!lastName = @patientData[0];
  #   $!firstName = @patientData[1];
  #   $!middleName = @patientData[2];
  #   $!dateOfBirth = Date.new(@patientData[3]);
  #   $!insurance = @patientData[4];
  #   $!ailment = @patientData[5];
  #   $!pin = @patientData[6];
  # }

  method calculateAge() {
    $!age = Date.today.year - $.dateOfBirth.year;
  }

  method print() {
    self.calculateAge;
    say "Last name: $.lastName";
    say "First name: $.firstName";
    say "Middle name: $.middleName";
    say "Date of birth: $.dateOfBirth";
    say "Insurance: $.insurance";
    say "Ailment: $.ailment";
    say "Age: $.age";
    say "Pin: $.pin";
    say "=================================";
  }

  method Str() {
    self.calculateAge;
    my $string = "$.lastName,$.firstName,$.middleName,$.dateOfBirth,$.insurance,$.ailment,$.age,$.pin";
  }

  # method getLast() returns Str {
  #   return $!last;
  # }

  # method getFirst() returns Str {
  #   return $!first;
  # }

  # method getMiddle() returns Str {
  #   return $!middle;
  # }

  # method getDob() returns Date {
  #   return $!dob;
  # }

  # method getInsurance() returns Str {
  #   return $!insurance;
  # }

  # method getAilment() returns Str {
  #   return $!ailment;
  # }

  # method getPin() returns Str {
  #   return $!pin;
  # }

  # method setLast(Str $last) {
  #   $!last = $last;
  # }

  # method setFirst(Str $first) {
  #   $!first = $first;
  # }

  # method setmiddle(Str $middle) {
  #   $!middle = $middle;
  # }

  # method setDob(Date $dob) {
  #   $!dob = $dob;
  # }

  # method setInsurance(Str $insurance) {
  #   $!insurance = $insurance;
  # }

  # method setAilment(Str $ailment) {
  #   $!ailment = $ailment;
  # }

  # method setPin(Str $pin) {
  #   $!pin = $pin;
  # }

}

