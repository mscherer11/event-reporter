require "./test/test_helper"
require "./lib/help_module"
require "pry"

class HelpModuleTest < Minitest::Test

  def test_print_all_possible_commands
    assert_equal "Available commands: load, queue count, queue clear, queue district, queue print, queue print by <attribute>,"\
      " queue save to <filename.csv>, queue export html <filename.html>, find <attribute> <criteria>, add, subtract", HelpModule.help
  end

  def test_help_load
    assert_equal "Erase any loaded data and parse the specified file. "\
    "If no filename is given, default to 'event_attendees.csv'.", HelpModule.help_load
  end

  def test_help_queue_count
    assert_equal "Outputs how many records are in the current queue", HelpModule.help_queue_count
  end

  def test_help_queue_clear
    assert_equal "Empties the queue", HelpModule.help_queue_clear
  end

  def test_help_queue_district
    assert_equal "If there are less than 10 entries in the queue, "\
    "this command will use the Sunlight API to get Congressional District information for each entry.", HelpModule.help_queue_district
  end

  def test_help_queue_print
    assert_equal "Print out a tab-delimited data table with a header row following this format:"\
      "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE  DISTRICT", HelpModule.help_queue_print
  end

  def test_help_queue_print_by
    assert_equal "Prints the queue sorted by the specified attribute like zipcode", HelpModule.help_queue_print_by
  end

  def test_help_save_to
    assert_equal "Exports the current queue to the specified filename as a CSV. "\
    "The file should should include data and headers for last name, first name, email, zipcode, city, state, address, and phone number.", HelpModule.help_save_to
  end

  def test_help_export_html
    assert_equal "Export the current queue to the specified filename as a valid HTML file."\
    "The file should use tables and include the data for all of the expected information.", HelpModule.help_export_html
  end

  def test_help_find
    assert_equal "Load the queue with all records matching the criteria for the given attribute.", HelpModule.help_find
  end

  def test_help_add
    assert_equal "Adds to the queue", HelpModule.help_add
  end

  def test_help_subtract
    assert_equal "Subtracts from the queue", HelpModule.help_subtract
  end

end
