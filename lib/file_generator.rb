require "csv"
require "pry"
require "erb"
require "./lib/data_scrub"

module FileGenerator

    def self.create_csv(filename, data)
      CSV.open(filename, "w") do |csv|
        csv << ["last_name","first_name","email","zipcode","city","state","address","phone_number","district"]
        data.each do |record|

          csv << [record.last_name, record.first_name, record.email, record.zipcode, record.city, record.state, record.street, record.phone, record.district]
        end
      end
      return filename
    end

    def self.create_html(filename, data)
      template_letter = File.read "form_file.erb"
      erb_template = ERB.new template_letter
      form_letter = erb_template.result(binding)
      create_html_file(filename, form_letter)
      return filename
    end

    def self.create_html_file(filename, form_letter)
      File.open(filename, "w") do |file|
        file.puts form_letter
      end
    end
end
