# frozen_string_literal: true

require 'ffi'

# Extern test doc
#
module ExternTest
  extend FFI::Library

  ffi_lib 'extern-test-rs/target/release/libextern_test.so'

  attach_function :hello, [], :pointer
  attach_function :drop_isize, [:pointer], :void
end

ptr = FFI::Pointer.new ExternTest.hello #=> FFI::Pointer
puts ptr
puts ptr.read :long
ptr.write :long, 202
puts ptr.read :long
ExternTest.drop_isize ptr

puts ptr.read :long

ptr.write :long, 55
