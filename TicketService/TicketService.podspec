Pod::Spec.new do |s|
  s.name             = 'TicketService'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TicketService.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Juzo Oda/TicketService'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Juzo Oda' => 'juzo.oda@mttnow.com' }
  s.source           = { :git => 'https://github.com/juzooda/tickets', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'TicketService/Classes/**/*'
  s.dependency 'ModelMapper', '~> 6.0'
end
