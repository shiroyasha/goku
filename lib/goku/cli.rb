module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(path)
      puts Goku::ElementFactory.new(path).create_class.to_s
    end

    desc "m PATH", "Create a module"
    def m(path)
      puts Goku::ElementFactory.new(path).create_module.to_s
    end

    map "module" => "m"
    map "class" => "m"

  end
end
