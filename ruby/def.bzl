# Repository rules
load("//ruby/toolchain:toolchains.bzl", _ruby_register_toolchains = "ruby_register_toolchains")
load("//ruby/private:library.bzl", _ruby_library = "ruby_library")
load("//ruby/private:binary.bzl", _ruby_binary = "ruby_binary")
load("//ruby/private:binary.bzl", _ruby_test = "ruby_test")
load("//ruby/private:bundle.bzl", _bundle_install = "bundle_install")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

ruby_register_toolchains = _ruby_register_toolchains
ruby_library = _ruby_library
# ruby_binary = _ruby_binary
ruby_test = _ruby_test
bundle_install = _bundle_install


def ruby_binary(name = None, **kwargs):

  _ruby_binary(
    name = name,
    **kwargs
  )

  pkg_tar(
    name = name + '_deploy',
    extension = '.tar.gz',
    package_dir = name,
    srcs = [name],
    strip_prefix = './',
    )
