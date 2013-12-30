UIDeviceHardware
================

A simple and easy to use helper class to extract more precisely the current hardware platform being used by the user.

It outputs three formats:

1. Platform format: The raw platform given by the system:
		
		// Outputs something like: iPhone3,1, iPod2,1, iPad3,6
        [UIDeviceHardware platform]

2. PlarformString format: A friendly and more readable format:

        // Outputs something like: iPhone 4, iPod Touch 2G, iPad 4 (GSM+CDMA)
        [UIDeviceHardware platformString]
        
3. GenericDeviceType format: A smart output based on the device type and screen size

        // Outputs something like: UIDeviceHardwareGenericTypePhone35, UIDeviceHardwareGenericTypePod40
        [UIDeviceHardware genericDeviceType]

General considerations
-------------------------
* Uses a more low level system information extractor for better performance
* This will be a constantly revised source for new devices released by Apple (last update: 12/30/2013)
* Supports even the simulator if needed (x86_64/Simulator/UIDeviceHardwareGenericTypeUnknown)

Live examples
-------------------------

    if ([UIDeviceHardware genericDeviceType] == UIDeviceHardwareGenericTypePhone35 ||
    	 [UIDeviceHardware genericDeviceType] == UIDeviceHardwareGenericTypePod35){
    	// do some stuff targeted to 3,5" iPhone or iPod Touch screens
    }
    else if ([UIDeviceHardware genericDeviceType] == UIDeviceHardwareGenericTypePhone40 ||
    	 [UIDeviceHardware genericDeviceType] == UIDeviceHardwareGenericTypePod40){
    	// do some stuff targeted to 4.0" iPhone or iPod Touch screens
    }
    else if ([UIDeviceHardware genericDeviceType] == UIDeviceHardwareGenericTypePad97){
    	// do some stuff targeted to the bigger 9,7" iPads
    }
    else if ([UIDeviceHardware genericDeviceType] == UIDeviceHardwareGenericTypePad79){
    	// do some stuff targeted to the iPad Minis
    }
    else{
    	// unknown hardware type.
    	// Possibly the simulator. Should throw an exception
    }
