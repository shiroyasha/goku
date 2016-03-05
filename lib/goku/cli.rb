module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(path)
      puts path
    end

    desc "m PATH", "Create a module"
    def m(path)
      puts path
    end

    map "module" => "m"
  end
end
