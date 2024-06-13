# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'JumioTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Jumio/Liveness', '~>4.10.0' # Liveness functionality
  pod 'Jumio/IProov', '~>4.10.0' # iProov liveness functionality
  pod 'Jumio/Jumio', '~>4.10.0' # Manual & DocFinder Capture + NFC functionality

  pod 'GMOpenSSL', '3.0.5'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if ['iProov'].include? target.name
        target.build_configurations.each do |config|
            config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
      end
    end
  end

end
