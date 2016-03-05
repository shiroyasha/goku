module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(path)
      puts path
    end

    map "c" => "class"
  end
end
