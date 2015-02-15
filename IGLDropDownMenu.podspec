Pod::Spec.new do |s|
  s.name     = 'IGLDropDownMenu'
  s.version  = '1.0.0'
  s.platform = :ios, '6.0'
  s.license  = 'MIT'
  s.summary  = 'An iOS drop down menu with pretty animation and easy to customize.'
  s.homepage = 'https://github.com/bestwnh/IGLDropDownMenu'
  s.author   = { 'Galvin Li' => 'b02437@gmail.com' }
  s.source   = { :git => 'https://github.com/bestwnh/IGLDropDownMenu.git', :tag => s.version.to_s }
  s.description = 'IGLDropDownMenu is a drop down menu that with pretty animation.' \
                  'It has multi styles and properties to customize your own menu.'
  s.frameworks   = 'UIKit'
  s.source_files = 'IGLDropDownMenu/*.{h,m}'
  s.requires_arc = true
end 