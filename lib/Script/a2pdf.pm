=head1 NAME

a2pdf - converts ASCII text to PDF format, with optional line/page numbering and Perl syntax highlighting

=head1 SYNOPSIS

 a2pdf [options] [filename]

=head2 Options

B<a2pdf> recognises the following command line options:

=over 4

=item --help

Displays usage message and exits.

=item --doc

Displays full documentation and exits.

=item --version

Prints the version number and exits

=item --output-file | -o

Specifies the filename for the PDF file. If this option is not set,
B<a2pdf> will output to STDOUT.

=item --title

Sets the title to be included in the page header. If unspecified, the
title will default to the name of the file which is being converted,
or to 'STDIN' if B<a2pdf> is processing from standard input.

=item --timestamp

Boolean option - if set, the timestamp of the file to be converted will
be included in the page header. This option is turned off by default.

=item --icon

Path to an image file which will be included as part of the header in 
the top left of each page.

Image files may be in any format supported by L<PDF::API2>.

=item --icon-scale

Scaling value for icon images, default is 0.25.

=item --header | --noheader | --notitle

Prints a header consististing of the page title, and optionally
the timestamp and an image icon at the top of each page.
This option is enabled by default, use C<--notitle> or 
C<--noheader> to disable.

=item --footer | --nofooter | --page-numbers | --nopage-numbers

Adds the current page number to the bottom of each page. This is enabled
by default, use C<--nofooter> or C<--nopage-numbers> to disable.

=item --line-numbers | --noline-numbers

By default, line numbers will be included in the output PDF file. To
disable this behaviour, use the C<--noline-numbers> option.

=item --perl-syntax | --noperl-syntax

Enables or disables (default is enabled) Perl syntax highlighting. This
feature requires that the Perl::Tidy module is installed.

=item --page-width

=item --page-height

Page width and height in points. Default page size is 595 x 842 (A4).

=item --page-size

Sets the page size to one of the 'standard' paper formats, e.g. "A4" 
or "Letter". Requires the module L<Paper::Specs> to be installed.

=item --page-orientation

Sets the page orientation, acceptable values are 'portrait' or 
'landscape'. Overrides the "--page-height" and "--page-width" options, 
i.e. the option set "--page-height=300 --page-width=100 
--page-orientation=landscape" will set the page height to 100 points 
and the width to 300 points to force landscape format.

=item --margins

=item --left-margin

=item --right-margin

=item --top-margin

=item --bottom-margin

Specifies the non-printable area of the page. The C<--margin> option will set
all margins to the same value, however individual margins may be altered with
the appropriate options. Values must be given in points. The default value for
the left and right margins is 48 points, and for the top and bottom margins is
60 points.

=item --font-face

Sets the font to use for the PDF file - currently this must be one of the PDF
core fonts. The default font face is Courier.

=item --font-size

Font size in points, default value is 10.

=item --line-spacing

Line spacing in points, default value is the font size + 2.

=item --noformfeed

By default, any formfeed characters in the input stream will be processed and
will act as expected, i.e. a new page will be started in the output PDF file.
This can be disabled with the C<--noformfeed> option which will cause all
formfeed characters to be ignored.

=item --settings

Location of a settings file (described below).

=back

Options may be given in any format recognised by the I<Getopt::Long> Perl
module, e.g. C<--name=value> or C<--name value>. Option names may be
abbreviated to their shortest unique value.

If the input filename is not given, then B<a2pdf> will expect to
receive input from STDIN.

=head2 Config / settings files

Options to B<a2pdf> may be stored in settings files. These have the same 
format as the command line options with the exception that the '--' 
chharacters preceding the option name are optional.

A single option may be contained on each line of the settings file, e.g.

 --timestamp
 icon=/usr/local/images/logo.png

At startup, B<a2pdf> looks for a default settings file named L<a2pdf.conf> 
in the current directory, the user's home directory, and the directory 
containing the B<a2pdf> script.

Settings will cascade as follows;

 Default 'a2pdf.conf' settings file              -->
 Settings file specified by '--settings' option  -->
 Options given on the command line

i.e. options on the command line will always take precedence. 

=head1 DEPENDENCIES

B<a2pdf> requires the L<PDF::API2> Perl module (tested with PDF::API2
version 0.3r77).

Perl syntax highlighting requires the L<Perl::Tidy> module (tested with
Perl::Tidy version 20031021).

To include images in the page header, the modules L<File::Type> and
L<Image::Size> must be installed.

To enable the "--page-size" option, the L<Paper::Specs> module must be installed.

=head1 BUGS / ISSUES

=over 4

=item *

If the Perl syntax highlighting feature is used and the input Perl code
uses source filter modules, then depending on the changes made by the
source filter the syntax highlighting may not be performed correctly. 

=back

=head1 SEE ALSO

B<a2pdf> homepage - L<http://perl.jonallen.info/projects/a2pdf>

pod2pdf - L<http://perl.jonallen.info/projects/pod2pdf>

PDF::API2 - L<http://search.cpan.org/dist/PDF-API2>

Perl::Tidy - L<http://search.cpan.org/dist/Perl-Tidy>

=head1 AUTHOR

Written by Jon Allen (JJ), <jj@jonallen.info> / L<http://perl.jonallen.info>

=head1 COPYRIGHT and LICENCE

Copyright (C) 2004 Jon Allen (JJ)

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut


1;
