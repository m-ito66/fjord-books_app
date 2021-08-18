# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @user = users(:alice)
    @another = users(:bob)
    @report = @user.reports.build(title: 'Hello', content: "I'm Alice.")
  end

  test '#editable?' do
    assert @report.editable?(@user)
    assert_not @report.editable?(@another)
  end
end
