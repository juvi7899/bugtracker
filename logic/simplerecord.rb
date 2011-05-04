require 'yaml'

class SimpleRecord
  attr_reader :instance_id

  def initialize
    @instance_id = self.class.get_instance_id
    self.class.add_instance(self)
  end

  def save
    self.class.instance_to_record(self)
  end

  def destroy
    self.class.remove_record(self)
  end

  class << self
    attr_accessor :elements, :record_fields

    @instances
    @records
    @instance_count

    def read(file_name = self.to_s)
      File.open("storage/" + file_name + ".yaml", "r") { |file| @records = YAML.load(file) }
      @instance_count = @records[@records.keys.last].instance_id
    end

    def write(file_name = self.to_s)
      File.open("storage/" + file_name + ".yaml", "w") { |file| file.puts(@records.to_yaml) }
    end

    def clear
      @records = {}
    end

    def get_instance_id
      @instance_count ||= 0
      @instance_count += 1
    end

    def add_instance(instance)
      @instances ||= {}
      @instances[instance.instance_id] = instance
    end

    def instance_to_record(instance)
      @records ||= {}
      @records[instance.instance_id] = instance.dup
    end

    def remove_record(instance)
      @records.delete(instance.instance_id)
    end

    def has_one(*fields)
      fields.each do |field|
        define_method(field) do
          instance_variable_get("@#{field}")
        end
        define_method("#{field}=") do |val|
          instance_variable_set("@#{field}", val)
        end
      end
    end

    def find(what, params = {})
      @records ||= {}
      result = []

      @records.each_value do |record|
        matching = true
        params.each_key do |key|
          begin
            if params[key].class.to_s == "String"
              if record.__send__(key).downcase != params[key].downcase
                matching = false
              end
            else
              if record.__send__(key) != params[key]
                matching = false
              end
            end
          rescue NoMethodError
            matching = false
          end
        end
        if matching
          if what == :first
            return record
          else
            result << record
          end
        end
      end
      if what == :first
        nil
      else
        result
      end
    end
  end
end
