$LOAD_PATH << './lib'

require 'xcodeproj'

# Open project.
project_path = 'MainProject.xcodeproj'
project = Xcodeproj::Project.open(project_path)

# Add a framework in project.
project.main_group.new_reference("MyFrameworkProject/MyFrameworkProject.xcodeproj",:group)

framework_ref = nil
project.root_object.project_references.objects.each do |object|
  object[:product_group].children.each do |proxy|
    if proxy && proxy.path == 'MyFrameworkProject.framework'
        framework_ref = proxy
        puts "find"
        break
    end
  end
end

# Get the main target
target = project.targets[0]
target.frameworks_build_phases.add_file_reference(framework_ref)

# Save
project.save
