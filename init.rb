FileUtils.mkdir_p(Rails.root.join('log/issue_open_date')) unless Dir.exist?(Rails.root.join('log/issue_open_date'))

require 'redmine'
require_dependency 'issue_open_date/hook_listener'
require_dependency 'issue_open_date/patches/issue_patch'

Redmine::Plugin.register :redmine_issue_open_date do
  name 'Redmine Issue Open Date plugin'
  url 'https://github.com/centosadmin/redmine_issue_open_date'
  description 'This is a plugin for Redmine which open freezed issues with specified oped date'
  version '0.1.1'
  author 'Centos-admin.ru'
  author_url 'http://centos-admin.ru'
  settings(default: {
    'freezed_statuses' => IssueStatus.where(is_closed: true).pluck(:id).map(&:to_s),
    'open_status' => IssueStatus.sorted.first.id.to_s
                    },
           partial: 'settings/issue_open_date')

end
