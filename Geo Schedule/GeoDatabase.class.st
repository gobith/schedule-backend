Class {
	#name : #GeoDatabase,
	#superclass : #Object,
	#instVars : [
		'actions'
	],
	#category : #'Geo Schedule'
}

{ #category : #accessing }
GeoDatabase >> actions [
	^ actions
]

{ #category : #accessing }
GeoDatabase >> fileContents [
	self subclassResponsibility
]

{ #category : #actions }
GeoDatabase >> fileInto: aSchedule [

	(self fileContents substrings: Character null asString) do: [ 
		:actionString | 
		| action |
		action := STON fromString: actionString.
		action addTo: aSchedule.
		aSchedule database actions add: action ]
]

{ #category : #initialization }
GeoDatabase >> initialize [ 

	super initialize.
	actions := OrderedCollection new
]

{ #category : #acccessing }
GeoDatabase >> modDateAndTime [ 

	self subclassResponsibility 
]

{ #category : #acccessing }
GeoDatabase >> nextId [ 
	
	^self subclassResponsibility 
]

{ #category : #actions }
GeoDatabase >> store: anAction [

	actions add: anAction.
	self write: (STON toString: anAction)
]

{ #category : #actions }
GeoDatabase >> write: aSTONString [

	self subclassResponsibility 
]
