# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:first_report)

    visit root_url
    assert_text 'アカウント登録もしくはログインしてください'
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'Hello'
    assert_text "I'm Alice."

    click_on '戻る'

    assert_text @report.created_at.strftime('%y/%m/%d')
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'Hi!'
    fill_in '内容', with: 'My hobby is reading books.'
    click_on '更新する'

    assert_text '日報が更新されました。'
    refresh
    assert_no_text '日報が更新されました。'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    refresh
    assert_no_text '削除'
  end
end
