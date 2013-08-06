Pod::Spec.new do |s|
  s.name         =  'CLToolkit'
  s.version      =  '0.0.3'
  s.summary      =  'CLToolkit is a collections of common macros, classes and utilities for Mac / iOS.'
  s.homepage     =  'https://github.com/collections/CLToolkit'
  s.author       =  { 'Tony Xiao' => 'tony@collections.me' }
  s.source       =  { :git => 'https://github.com/collections/CLToolkit.git', :tag => "#{s.version}" }
  s.license      =  'MIT'
  
  # Platform setup
  s.osx.deployment_target = '10.8'
  s.ios.deployment_target = '6.0'
  s.requires_arc = true

  
  # Include only the core by default
  s.default_subspec = 'Core'

  ### Subspecs
  
  s.subspec 'Core' do |ss|
    ss.source_files =  'CLToolkit/Core/**/*.{h,m,mm,c}'
    ss.osx.framework = 'Cocoa'
    ss.ios.framework = 'UIKit'
    
    ss.dependency 'ConciseKit'
    ss.dependency 'BlocksKit'
    ss.dependency 'ReactiveCocoa'
    ss.dependency 'NSLogger'
    ss.dependency 'ISO8601DateFormatter'

  end
  
  s.subspec 'Networking' do |ss|
    ss.source_files   = 'CLToolkit/Networking/**/*.{h,m,mm,c}'
    
    ss.dependency       'CLToolkit/Core'
    ss.dependency       'AFNetworking'
    ss.dependency       'Base64'
  end
  
  s.subspec 'Operation' do |ss|
    ss.source_files   = 'CLToolkit/Operation/**/*.{h,m,mm,c}'
    
    ss.dependency       'CLToolkit/Core'
  end
  
  s.subspec 'CoreData' do |ss|
    ss.source_files   = 'CLToolkit/CoreData/**/*.{h,m,mm,c}'
    ss.framework      = 'CoreData'
    
    ss.dependency       'CLToolkit/Core'
    ss.dependency       'CLToolkit/Operation'
    ss.dependency       'MagicalRecord'
    ss.dependency       'Base64'
  end
  
  s.subspec 'Misc' do |ss|
    ss.source_files   = 'CLToolkit/Misc/**/*.{h,m,mm,c}'

    ss.osx.frameworks = 'Quartz'
    ss.dependency       'CLToolkit/Core'
    ss.dependency       'NSHash'
  end
end
