package Audio::Mad::Stream;
1;
__END__

=head1 NAME

Audio::Mad::Stream - Interface to mad_stream structure

=head1 SYPNOSIS

 my $stream = new Audio::Mad::Stream;
 $stream->buffer($scalar);
 
 my $remain = substr($scalar, $stream->next_frame);
 my $position = $stream->this_frame;
 
 $stream->skip($position + 400);
 $stream->sync();
 
 unless ($stream->err_ok()) {
 	print "error code was: " . $stream->error() . "\n";
 }
 
=head1 DESCRIPTION

 This package provides an interface to the underlying mad_stream 
 structure used in the decoder library.  Almost all of the methods
 from the library are implemented,  and work on regualar perl data
 types.
 
=head1 METHODS

=over 4

=item * new

 Allocates and initializes a new mad_stream structure,  and 
 provides us with a handle to access it.

=item * buffer(scalar)

 Takes a scalar,  and feeds it's data to the underlying 
 mad_stream_buffer function.  This part of the module isn't 
 so hammered out just yet,  it should work just fine,  but 
 there may be memory leaks / garbage collection issues just 
 yet (although,  I haven't seen anything unusual).
 
=item * skip(length)

 Skips 'length' bytes in the input stream.
 
=item * sync

 Skips forward to the next MPEG sync word available in the 
 buffer.
 
=item * this_frame

 Returns the offset (in bytes) of the current buffer.  You 
 may use this as an index into the scalar that was passed to 
 'buffer'.
 
=item * next_frame

 Returns the offset (in bytes) of the next frame in the 
 current buffer.
 
=item * error

 Returns a numeric error code indicating the last problem 
 encountered while gobbling up stream.  Error codes 
 correspond to the MAD_ERROR_ constants.
 
=item * err_ok

 Returns 1 if the last error is recoverable,  according to the 
 MAD_RECOVERABLE macro.
 
=back

=head1 AUTHOR

  Mark McConnell <mischke@cpan.org>
  
=cut
