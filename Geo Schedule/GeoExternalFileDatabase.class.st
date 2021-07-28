Class {
	#name : #GeoExternalFileDatabase,
	#superclass : #GeoDatabase,
	#instVars : [
		'mutex'
	],
	#category : #'Geo Schedule'
}

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
