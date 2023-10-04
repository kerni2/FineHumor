# frozen_string_literal: true

class UserBulkService < ApplicationService
  attr_reader :archive

  # rubocop:disable Lint/MissingSuper
  def initialize(archive_param)
    @archive = archive_param.tempfile
  end
  # rubocop:enable Lint/MissingSuper

  def call
    Zip::File.open(@archive) do |zip_file|
      zip_file.glob('*.xlsx').each do |entry|
        User.import users_from(entry), ignore: true
      end
    end
  end

  private

  def users_from(entry)
    sheet = RubyXL::Parser.parse_buffer(entry.get_input_stream.read)[0]
    sheet.map do |row|
      cells = row.cells[0..1].map { |c| c&.value.to_s }
      User.new email: cells[0],
               password: cells[1],
               password_confirmation: cells[1]
    end
  end
end
