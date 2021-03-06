item updating
updateItemWithInteger: anInteger
	"Update the HIDShortItem header and data. Encode the integer given
	 as parameter as a byte array and change the header size field."
	| byteArray byteArraySize |
	byteArray := self bytesWithMinimalSizeFromInteger: anInteger.
	"Data can only be old in byte arrays of size 0,1,2 and 4 according to the hid specification."
	byteArraySize := byteArray size.
	byteArraySize = 3
		ifTrue: [ 
			byteArray := self bytesFromInteger: anInteger withSize: 4.
			byteArraySize := byteArraySize + 1 ].
	self
		item: (HIDShortItem
					rawData: {(self shortItemHeaderWithSize: byteArraySize)} asByteArray , byteArray)