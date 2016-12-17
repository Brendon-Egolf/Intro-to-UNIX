## Purpose: Represent employee data as an object

unit module employee;
use strict;

class Employee is export {
  has $.departmentNumber;
  has $.idNumber;
  has $.yearsOfService;

  method new($departmentNumber, $idNumber, $yearsOfService) {
    self.bless(:$departmentNumber, :$idNumber, :$yearsOfService);
  }
}
