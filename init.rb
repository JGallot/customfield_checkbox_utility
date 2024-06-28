require 'redmine'
require File.expand_path('lib/view_hooks.rb',__dir__)

Redmine::Plugin.register :customfield_checkbox_utility do

  name 'Customfield Checkbox Utility plugin'
  author 'Jérôme GALLOT (initial : preciousplum)'
  description 'This plugin is to improve the usability for Custom Fields of "User" and "List" Format. '
  version '0.0.4'
  url 'https://github.com/JGallot/customfield_checkbox_utility'
  author_url 'https://github.com/JGallot/'
  requires_redmine :version_or_higher => '5.0'
end
Rails.application.config.after_initialize do

  unless Redmine::FieldFormat::List.included_modules.include? CustomfieldCheckboxUtility::ListPatch
    Redmine::FieldFormat::List.send :include, CustomfieldCheckboxUtility::ListPatch
  end
  unless Project.included_modules.include? CustomfieldCheckboxUtility::ProjectPatch
    Project.send :include, CustomfieldCheckboxUtility::ProjectPatch
  end
end
