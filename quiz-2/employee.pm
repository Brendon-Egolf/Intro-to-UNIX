## Purpose: Represent employee data as an object

unit module employee;
use strict;

class Patient is export {
  has Int $.departmentNumber;
  has Int $.idNumber;
  has Int $.yearsOfService;

  method new($departmentNumber, $idNumber, $yearsOfService) {
    self.bless(:$departmentNumber, :$idNumber, :$yearsOfService);
  }
}
