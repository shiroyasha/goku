module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(raw_path)
      path = Goku::Path.new(raw_path)

      modules = path.directories.drop(1).map do |module_name|
        Goku::Factories::Module.new(module_name)
      end

      klass = Goku::Factories::Class.new(path.filename)
      klass.add(Goku::Factories::Method.new("initialize"))

      modules.last.add(klass)

      modules.reverse.each_cons(2) do |submodule, parent_module|
        parent_module.add(submodule)
      end

      puts modules.first.to_s
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
