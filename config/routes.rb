RedmineApp::Application.routes.draw do
  match 'timesheet/index',        :to => 'timesheet#index',        :via => [:get]
  match 'timesheet/context_menu', :to => 'timesheet#context_menu', :via => [:get]
  match 'timesheet/report',       :to => 'timesheet#report',       :via => [:get,:post]
  match 'timesheet/reset',        :to => 'timesheet#reset',        :via => [:delete]
end

