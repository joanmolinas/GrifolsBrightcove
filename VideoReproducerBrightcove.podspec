Pod::Spec.new do |s|
	s.name          = "VideoReproducerBrightcove"
	s.version       = "0.0.1"
	s.summary       = "A brightcove handler"

	s.homepage      = "http://grifols.com"
	s.license       = "MIT"

	s.author        = { "Joan Molinas Ramon" => "joan.molinas@external.grifols.com" }
	s.platform      = :ios

	s.source        = { :git => "https://github.com/ulidev/GrifolsBrightcove.git", :tag => "#{s.version}"}
	s.source_files  = "Source", "Source/**/*.swift"

#	s.dependency 	'Brightcove-Player-Core/dynamic'
	s.dependency 	'Alamofire', '~> 4.7'

end
