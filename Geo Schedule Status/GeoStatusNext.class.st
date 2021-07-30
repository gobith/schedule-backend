Class {
	#name : #GeoStatusNext,
	#superclass : #Object,
	#instVars : [
		'status',
		'next'
	],
	#category : #'Geo Schedule Status'
}

{ #category : #initialization }
GeoStatusNext >> initialize [ 

	super initialize .
	next := OrderedCollection new.
]

{ #category : #accessing }
GeoStatusNext >> next [

	^ next
]

{ #category : #accessing }
GeoStatusNext >> next: aStatus [

	next add: aStatus
]

{ #category : #accessing }
GeoStatusNext >> status [

	^ status
]

{ #category : #accessing }
GeoStatusNext >> status: anObject [

	status := anObject
]
