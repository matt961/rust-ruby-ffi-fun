# frozen_string_literal: true

require 'ffi'

# Extern test doc
#
module ExternTest
  extend FFI::Library

  ffi_lib 'extern-test-rs/target/release/libextern_test.so'

  attach_function :hello, [], :pointer
  attach_function :drop_str, [:pointer], :void
end

auto_p = FFI::AutoPointer.new(
  FFI::Pointer.new(ExternTest.hello),
  ExternTest.method(:drop_str)
)
binding.pry
puts auto_p
s = auto_p.read_string
puts s
