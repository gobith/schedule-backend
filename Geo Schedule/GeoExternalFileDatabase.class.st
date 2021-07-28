Class {
	#name : #GeoExternalFileDatabase,
	#superclass : #GeoDatabase,
	#instVars : [
		'mutex'
	],
	#category : #'Geo Schedule'
}

{ #category : #acccessing }
GeoExternalFileDatabase >> fileContents [
	| contents fileReference |
	fileReference := self fileReference.
	fileReference exists
		ifFalse: [ ^'' ].
	contents := fileReference contents.
	^contents
]

{ #category : #acccessing }
GeoExternalFileDatabase >> fileReference [
	^'./schedule.txt' asFileReference 
]

{ #category : #initialization }
GeoExternalFileDatabase >> initialize [ 

	super initialize .
	mutex := Mutex new
]

{ #category : #acccessing }
GeoExternalFileDatabase >> modDateAndTime [ 

	^DateAndTime now
]

{ #category : #acccessing }
GeoExternalFileDatabase >> nextId [ 
	
	^UUID new asString
]

{ #category : #actions }
GeoExternalFileDatabase >> write: aSTONString [	
	
	mutex
		critical: [ self fileReference
				writeStreamDo: [ :writeStream | 
					writeStream setToEnd.
					writeStream
						nextPutAll: aSTONString;
						nextPut: Character null ] ]
]
