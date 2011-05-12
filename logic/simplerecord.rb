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
      file_path = "storage/" + file_name + ".yaml"

      if File.zero?(file_path)
        @records = {}
        @instance_count = 0
      else
        File.open(file_path, "r") { |file| @records = YAML.load(file) }

        if @records.size > 0
          @instance_count = @records[@records.keys.last].instance_id
        else
          @instance_count = 0
        end

      end

    end

    def read_or_create(file_name = self.to_s)
      file_path = "storage/" + file_name + ".yaml"

      if !File.exists?(file_path)
        FileUtils.touch(file_path)
      end

      read(file_name)
    end

    def write(file_name = self.to_s)
      File.open("storage/" + file_name + ".yaml", "w") { |file| file.puts(@records.to_yaml) }
    end

    def clear
      @records = {}
      @instance_count = 0
    end

    def size
      @records.size
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

    alias :has_one :attr_reader
    alias :belongs_to :attr_accessor

    def has_many(related_class, related_class_method, field)

      define_method(field) do |*val|
        params = { related_class_method.to_s => self }
        params = params.merge(val[0]) if !val.empty?
        Kernel.const_get(related_class).__send__ :find, :all, params
      end

    end

    def find(what, params = {})
      @records ||= {}
      result = []

      @records.each_value do |record|
        matching = true

        params.each_key do |key|
          begin

            if params[key].kind_of?(SimpleRecord)
              if record.__send__(key).class.to_s != params[key].class.to_s || record.__send__(key).instance_id != params[key].instance_id
                  matching = false
              end

            elsif params[key].class.to_s == "String"

              if params[key].start_with?('~')
                if !record.__send__(key).downcase.index(params[key].downcase[1,params[key].size])
                  matching = false
                end
              elsif record.__send__(key).downcase != params[key].downcase
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
