doing - descriptor
activeConfigDescriptorDo: aBlock
	"Perform an action with the LUConfigDescriptor of this device.
	 This method ensure that the config descriptor is freed after it has been used.
	 The block given as parameter takes one parameter that is the LUConfigDescriptor.
	 !This method does not return the result of the block evaluation!"
	| configDescriptor |
	configDescriptor := self activeConfigDescriptor.
	[ aBlock value: configDescriptor ]
		ensure: [ configDescriptor libusbFree ]