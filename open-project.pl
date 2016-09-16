#!/usr/bin/perl -w

$directory = 'project-' . $ARGV[0];
opendir(DH, $directory);
my @files = readdir(DH);
closedir(DH);

foreach my $file (@files) {
  next if($file =~ /^\.+$/);
  if ($file =~ /^.*\.pdf/) {
    system('mupdf', "$directory/$file", '&');
    print("opening $directory/$file");
  }
}
