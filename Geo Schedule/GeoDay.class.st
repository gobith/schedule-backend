Class {
	#name : #GeoDay,
	#superclass : #GeoNode,
	#category : #'Geo Schedule-Templates'
}

{ #category : #accessing }
GeoDay >> name [

	^timespan dayOfMonth printString
]
