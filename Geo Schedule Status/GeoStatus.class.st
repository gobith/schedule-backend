Class {
	#name : #GeoStatus,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'name',
		'next',
		'menuName'
	],
	#category : #'Geo Schedule Status'
}

{ #category : #initialization }
GeoStatus >> initialize [ 

	super initialize.
	next := OrderedCollection new
]

{ #category : #accessing }
GeoStatus >> menuName [

	^ menuName
]

{ #category : #accessing }
GeoStatus >> menuName: anObject [

	menuName := anObject
]

{ #category : #accessing }
GeoStatus >> name [

	^ name
]

{ #category : #accessing }
GeoStatus >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoStatus >> next [

	^ next
]

{ #category : #accessing }
GeoStatus >> next: aStatus [

	next add: aStatus
]

{ #category : #accessing }
GeoStatus >> symbol [

	^ symbol
]

{ #category : #accessing }
GeoStatus >> symbol: anObject [

	symbol := anObject
]
