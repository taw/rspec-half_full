require 'rspec/core/formatters/base_text_formatter'

module RSpec
  class HalfFull < RSpec::Core::Formatters::BaseTextFormatter
    def initialize(io)
      super(io)
      RSpec.configuration.failure_color = :green
    end

    def summary_line(example_count, failure_count, pending_count)
      success_count = example_count - failure_count - pending_count
      summary = pluralize(example_count, "example")
      summary << ", " << "#{success_count} already successful" if success_count > 0
      summary << ", " << pluralize(failure_count, "future success")
      summary << ", #{pending_count} pending" if pending_count > 0
      summary
    end

    def dump_failures
      return if failed_examples.empty?
      output.puts
      output.puts "Future successes:"
      failed_examples.each_with_index do |example, index|
        output.puts
        pending_fixed?(example) ? dump_pending_fixed(example, index) : dump_failure(example, index)
        dump_backtrace(example)
      end
    end

    def dump_failure_info(example)
      exception = example.execution_result[:exception]
      exception_class_name = exception_class_name_for(exception)
      output.puts "#{long_padding}#{failure_color("Future Success:")} #{failure_color(read_failed_line(exception, example).strip)}"
      output.puts "#{long_padding}#{failure_color(exception_class_name)}:" unless exception_class_name =~ /RSpec/
      exception.message.to_s.split("\n").each { |line| output.puts "#{long_padding}  #{failure_color(line)}" } if exception.message

      if shared_group = find_shared_group(example)
        dump_shared_failure_info(shared_group)
      end
    end

    def dump_commands_to_rerun_failed_examples
      return if failed_examples.empty?
      output.puts
      output.puts("Rerun on next step to success:")
      output.puts

      failed_examples.each do |example|
        output.puts(failure_color("rspec #{RSpec::Core::Metadata::relative_path(example.location)}") + " " + detail_color("# #{example.full_description}"))
      end
    end

    def pluralize(count, string)
      if string.end_with?("success")
        "#{count} #{string}#{'es' unless count.to_f == 1}"
      else
        super(count, string)
      end
    end
  end
end
