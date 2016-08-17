package VC9WorkspaceCreator;

# ************************************************************
# Description   : A VC9 Workspace Creator
# Author        : Johnny Willemsen
# Create Date   : 11/22/2007
# ************************************************************

# ************************************************************
# Pragmas
# ************************************************************

use strict;

use VC9ProjectCreator;
use VC8WorkspaceCreator;

use vars qw(@ISA);
@ISA = qw(VC8WorkspaceCreator);

# ************************************************************
# Subroutine Section
# ************************************************************

sub pre_workspace {
  my($self, $fh) = @_;
  my $crlf = $self->crlf();

  print $fh '﻿', $crlf,
            'Microsoft Visual Studio Solution File, Format Version 10.00', $crlf;
  $self->print_workspace_comment($fh,
            '# Visual Studio 2008', $crlf,
            '#', $crlf,
            '# This file was generated by MPC.  Any changes made directly to', $crlf,
            '# this file will be lost the next time it is generated.', $crlf,
            '#', $crlf,
            '# MPC Command:', $crlf,
            '# ', $self->create_command_line_string($0, @ARGV), $crlf);
}

sub website_trailing_slash {
  return 0;
}

sub website_extra_props {
  my($self, $fh) = @_;
  print $fh "\t\t" . 'TargetFramework = "3.5"' . $self->crlf();
}

1;
