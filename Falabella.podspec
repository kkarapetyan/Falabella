Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "Falabella"
s.summary = "Falabella is a library for custom authentication"
s.requires_arc = true

s.version = "1.0.4"

s.author = { "Karine Karapetyan" => "karapetyankarine87@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/kkarapetyan/Falabella"

s.source = { :git => "https://github.com/kkarapetyan/Falabella.git",
:tag => "#{s.version}" }

s.framework = "UIKit"
s.dependency 'Alamofire'
s.dependency 'CryptoSwift'

s.source_files = "Falabella/**/*.{swift, xib, png}"
s.resources = "Falabella/*.{xcdatamodeld, xib, png, json}"
s.resource_bundles = {
    'Falabella' => ['Pod/**/*.xib']
  }



s.swift_version = "4.2"

end
