## Assignment: Project 7
## Author: Brendon Egolf (begolf123@gmail.com)
## Version: 0.0.1
## Purpose: Delete a user from the file systea

use strict;

my $userName;

sub main() {
  $userName = @ARGV[0];
  archiveFiles();
  removeUserFiles();
}

sub removeUserFiles() {
  say "Removing the files of $user";
  my $path = "/home/$userName/";
  system("rm -rf $path");
}

sub deleteUser() {
  say "Deleting $user from the system";
  system("userdel $user");
}

sub archiveFiles() {
  say "Archiving files to /home/$userName.tar.gz";
  my $path = "/home/$userName/";
  system("tar -zcvf /home/$userName.tar.gz $path");
}
