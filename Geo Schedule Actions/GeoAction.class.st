Class {
	#name : #GeoAction,
	#superclass : #Object,
	#instVars : [
		'id',
		'modDateAndTime',
		'payload'
	],
	#category : #'Geo Schedule Actions'
}

{ #category : #'instance creation' }
GeoAction class >> fromPayload: aDictionary schedule: aSchedule [

	^self new fromPayload: aDictionary schedule: aSchedule
]

{ #category : #initialization }
GeoAction >> fromPayload: aDictionary schedule: aSchedule [

	modDateAndTime := aSchedule modDateAndTime.
	payload := aDictionary.
	
	aSchedule database store: self.
	^self addTo: aSchedule.
]
