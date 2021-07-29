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

{ #category : #private }
GeoAction >> addIdentityFrom: aSchedule [

	payload at: 'id' put: aSchedule nextId
]

{ #category : #actions }
GeoAction >> addTo: aSchedule [

	self subclassResponsibility 
]

{ #category : #initialization }
GeoAction >> fromPayload: aDictionary schedule: aSchedule [

	modDateAndTime := aSchedule modDateAndTime.
	payload := aDictionary.
	self privateFrom: aSchedule.
	aSchedule database store: self.
	^ self addTo: aSchedule
]

{ #category : #actions }
GeoAction >> privateFrom: aSchedule [
]
