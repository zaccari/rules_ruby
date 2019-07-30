# Repository rules
load("//ruby/toolchain:toolchains.bzl", _ruby_register_toolchains = "ruby_register_toolchains")
load("//ruby/private:library.bzl", _ruby_library = "ruby_library")
load("//ruby/private:binary.bzl", _ruby_binary = "ruby_binary")
load("//ruby/private:binary.bzl", _ruby_test = "ruby_test")

ruby_register_toolchains = _ruby_register_toolchains
ruby_library = _ruby_library
ruby_binary = _ruby_binary
ruby_test = _ruby_test
