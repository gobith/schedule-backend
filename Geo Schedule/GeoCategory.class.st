Class {
	#name : #GeoCategory,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'description',
		'userStatus'
	],
	#category : #'Geo Schedule'
}

{ #category : #accessing }
GeoCategory >> description [

	^ description
]

{ #category : #accessing }
GeoCategory >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GeoCategory >> id [

	^ id
]

{ #category : #accessing }
GeoCategory >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GeoCategory >> initialize [ 

	super initialize.
	userStatus := Dictionary new
]

{ #category : #accessing }
GeoCategory >> name [

	^ name
]

{ #category : #accessing }
GeoCategory >> name: anObject [

	name := anObject
]

{ #category : #printing }
GeoCategory >> printOn: aStream [

	aStream
		nextPutAll: name
]

{ #category : #accessing }
GeoCategory >> userStatus [

	^userStatus
]
