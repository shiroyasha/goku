module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(raw_path)
      path = Goku::Path.new(raw_path)

      modules = create_modules(path)

      modules.last.add(Goku::Factories::Class.new(path.filename))

      puts modules.first.to_s
    end

    desc "m PATH", "Create a module"
    def m(raw_path)
      path = Goku::Path.new(raw_path)

      modules = create_modules(path)

      modules.last.add(Goku::Factories::Module.new(path.filename))

      puts modules.first.to_s
    end

    map "module" => "m"
    map "class" => "m"

    private

    def create_modules(path)
      modules = path.directories.drop(1).map { |m| Goku::Factories::Module.new(m) }

      modules.reverse.each_cons(2) do |submodule, parent_module|
        parent_module.add(submodule)
      end

      modules
    end
  end
end
