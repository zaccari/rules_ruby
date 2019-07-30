load(
  "@com_github_zaccari_rules_ruby//ruby:def.bzl",
  "ruby_library",
)

package(default_visibility = ["//visibility:public"])

filegroup(
  name = "binstubs",
  srcs = glob(["bin/**/*"]),
  data = [":libs"],
)

ruby_library(
  name = "libs",
  srcs = glob(
    include = [
      # TODO(framegrace) Support other ruby engines
      # TODO(framegrace) Fix the ruby_version with the given interpter.
      "lib/ruby/*/gems/*/**/*",
      "lib/ruby/*/bin/**/*",
    ],
    exclude = {exclude},
  ),
  deps = [":bundler_setup"],
  rubyopt = ["-r../{repo_name}/lib/bundler/setup.rb"],
)

ruby_library(
  name = "bundler_setup",
  srcs = ["lib/bundler/setup.rb"],
  visibility = ["//visibility:private"],
)

# vim: set ft=bzl :
