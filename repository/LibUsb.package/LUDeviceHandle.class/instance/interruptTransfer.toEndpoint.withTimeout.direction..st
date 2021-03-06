synchronous device I/O
interruptTransfer: aCharArray toEndpoint: endpoint withTimeout: milliseconds direction: aLUEndpointDirectionEnumeration
	<libusbHighlevelFor: #libusbInterruptTransferFor:endpoint:data:length:numberOfByteTransferred:timeout:>
	| numberOfByteTransfered result |
	numberOfByteTransfered := LUIntegerValueHolder new.
	result := self libusb
					libusbInterruptTransferFor: self
					endpoint: (endpoint
									bitOr: aLUEndpointDirectionEnumeration value)
					data: aCharArray
					length: aCharArray size
					numberOfByteTransferred: numberOfByteTransfered
					timeout: milliseconds.
	
	result = LUErrorEnumeration LIBUSB_SUCCESS
		ifFalse: [ self libusbErrorCode: result ].
	
	^ numberOfByteTransfered value