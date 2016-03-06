module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(path)
      factory = Goku::ElementFactory.new(path)

      puts factory.create_class.to_s
      puts "---------------------"
      puts factory.create_spec.to_s
    end

    desc "m PATH", "Create a module"
    def m(path)
      factory = Goku::ElementFactory.new(path)

      puts factory.create_module.to_s
      puts "---------------------"
      puts factory.create_spec.to_s
    end

    map "module" => "m"
    map "class" => "m"

  end
end
