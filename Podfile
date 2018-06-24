platform :ios,'10.0'
def pods
    pod 'AFNetworking', '~> 3.0'
    
    #react-native
    pod ‘React’, :path => './YooRN/node_modules/react-native', :subspecs => [
    'Core',             
    'BatchedBridge',    
    'DevSupport',      
    'ART',
    'RCTActionSheet',
    'RCTAnimation',
    'RCTCameraRoll',
    'RCTGeolocation',
    'RCTImage',
    'RCTNetwork',
    'RCTPushNotification',
    'RCTSettings',
    'RCTText',
    'RCTVibration',
    'RCTWebSocket',
    'RCTLinkingIOS'
    ]
    pod 'Yoga', :path => './YooRN/node_modules/react-native/ReactCommon/yoga'
end
target 'YooIOS' do
	pods
end
