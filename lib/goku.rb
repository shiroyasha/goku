require "thor"
require "active_support/all"

require "goku/factories/base"
require "goku/factories/method"
require "goku/factories/class"
require "goku/factories/module"

require "goku/path"
require "goku/version"

module Goku
  require_relative "goku/cli"
end
