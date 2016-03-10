require "thor"
require "active_support/all"
require "fileutils"
require "colorize"

require "goku/ruby"

require "goku/path"
require "goku/version"

module Goku
  require_relative "goku/cli"
end
