Class {
	#name : #GeoNode,
	#superclass : #Object,
	#instVars : [
		'timespan',
		'children'
	],
	#category : #'Geo Schedule Templates'
}

{ #category : #comparing }
GeoNode >> < aNode [

	^timespan < aNode timespan
]

{ #category : #comparing }
GeoNode >> <= aNode [

	^timespan <= aNode timespan
]

{ #category : #accessing }
GeoNode >> children [

	^ children
]

{ #category : #initialization }
GeoNode >> initialize [ 

	super initialize.
	children := SortedCollection sortBlock: [ :a :b | a <= b ]
]

{ #category : #accessing }
GeoNode >> timespan [

	^ timespan
]

{ #category : #accessing }
GeoNode >> timespan: anObject [

	timespan := anObject
]
