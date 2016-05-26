Pod::Spec.new do |s|

  s.name         = "NaiveBayes"
  s.version      = "0.0.1"
  s.summary      = "NaiveBayes"
  s.homepage     = "https://github.com/hakkojapan/NaiveBayes"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "hakozaki" => "pako041222@gmail.com" }  
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/hakkojapan/NaiveBayes.git", :tag => "#{s.version}" }
  s.source_files = "NaiveBayes/**/*.{h,m,swift}"
 end
