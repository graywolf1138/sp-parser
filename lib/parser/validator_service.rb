# frozen_string_literal: true

class ValidatorService
  NoFile              = Class.new StandardError
  FileNotFoundError   = Class.new StandardError
  FileExtensionError  = Class.new StandardError
  FileEmptyError      = Class.new StandardError

  SUPPORTED_EXTENSIONS = %w[.log].freeze

  def self.valid?(file_path)
    raise NoFile, 'Please, specify path to file as argument' if file_path.nil?
    raise FileNotFoundError, 'File not found' unless File.exist?(file_path)
    raise FileExtensionError, 'File extension not supported' unless SUPPORTED_EXTENSIONS.include?(File.extname(file_path))
    raise FileEmptyError, 'File is empty' if File.empty?(file_path)

    true
  end
end
