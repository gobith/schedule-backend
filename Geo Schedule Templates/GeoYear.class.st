Class {
	#name : #GeoYear,
	#superclass : #GeoNode,
	#category : #'Geo Schedule Templates'
}

{ #category : #accessing }
GeoYear >> name [

	^ timespan start year printString
]
