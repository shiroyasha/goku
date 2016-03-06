module Goku
  class CLI < Thor

    desc "c PATH", "Create a class"
    def c(raw_path)
      path = Goku::Path.new(raw_path)
      factory = Goku::ElementFactory.new(path)

      implementation = factory.create_class.to_s
      spec = factory.create_spec.to_s

      save(path, implementation, spec)
    end

    desc "m PATH", "Create a module"
    def m(raw_path)
      path = Goku::Path.new(raw_path)
      factory = Goku::ElementFactory.new(path)

      implementation = factory.create_module.to_s
      spec = factory.create_spec.to_s

      save(path, implementation, spec)
    end

    map "module" => "m"
    map "class" => "m"

    private

    def save(path, implementation, spec)
      failure("File '#{path.full}' already exists") if path.exists?
      failure("Spec '#{path.to_spec.full}' already exists") if path.to_spec.exists?

      puts "Creating '#{path.full}'"
      FileUtils.mkdir_p(File.dirname(path.full))
      File.write(path.full, implementation)

      puts "Creating '#{path.to_spec.full}'"
      FileUtils.mkdir_p(File.dirname(path.to_spec.full))
      File.write(path.to_spec.full, spec)
    end

    def failure(message)
      puts message

      exit(1)
    end

  end
end
