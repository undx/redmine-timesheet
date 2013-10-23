require 'redmine'
require 'csv'
require_dependency 'project'
User.send(:include, TimesheetPlugin::Patches::UserPatch)
Project.send(:include, TimesheetPlugin::Patches::ProjectPatch)
begin
  require_dependency 'time_entry_activity'
rescue LoadError
  # TimeEntryActivity is not available
end

Redmine::Plugin.register :timesheet do
  name 'Timesheet'
  author 'undx (Based on Eric Davis\' work)'
  description 'This is a Timesheet plugin for Redmine to show timelogs for all projects'
  url 'http://github.com/undx/redmine-timesheet'
  author_url 'http://www.undx.net'
  version '0.7.0'
  #
  requires_redmine :version_or_higher => '2.1.0'
  #
  settings(:default => {
             'list_size' => '5',
             'precision' => '2',
             'project_status' => 'active',
             'user_status' => 'active'
           }, :partial => 'settings/timesheet_settings')
  permission :see_project_timesheets, { }, :require => :member
  menu(:top_menu,
       :timesheet,
       {:controller => 'timesheet', :action => 'index'},
       :caption => :timesheet_title,
       :if => Proc.new {
         User.current.allowed_to?(:see_project_timesheets, nil, :global => true) ||
         User.current.allowed_to?(:view_time_entries, nil, :global => true) ||
         User.current.admin?
       })
end
