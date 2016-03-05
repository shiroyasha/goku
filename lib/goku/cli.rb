module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(raw_path)
      path = Goku::Path.new(raw_path)

      klass = Goku::Factories::Class.new(path.filename)
      klass.add_method(Goku::Factories::Method.new("initialize"))

      puts klass
    end

    desc "m PATH", "Create a module"
    def m(raw_path)
      path = Goku::Path.new(raw_path)

      mod = Goku::Factories::Module.new(path.filename)

      puts mod
    end

    map "module" => "m"
    map "class" => "m"
  end
end
