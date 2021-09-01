# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:first_report)
  end

  test 'failure to create a Report with title empty' do
    @report.title = nil

    assert @report.invalid?
    assert_includes @report.errors[:title], 'を入力してください'
  end

  test 'failure to create a Report with content empty' do
    @report.content = nil

    assert @report.invalid?
    assert_includes @report.errors[:content], 'を入力してください'
  end

  test '#editable?' do
    user = users(:alice)
    another = users(:bob)
    @report = user.reports.build(title: 'Hello', content: "I'm Alice.")
    assert @report.editable?(user)
    assert_not @report.editable?(another)
  end

  test '#created_on' do
    assert_equal @report.created_at.to_date, @report.created_on
  end
end
