# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user = users(:alice)
    another = users(:bob)
    report = user.reports.build(title: 'Hello', content: "I'm Alice.")
    assert report.editable?(user)
    assert_not report.editable?(another)
  end
end
